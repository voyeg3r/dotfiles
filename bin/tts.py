# tts.py

import os
import re
from tempfile import mktemp
from urllib import urlencode

from http_client import Client

class TtsError(RuntimeError):
    pass

class TtsServerError(TtsError):
    pass

class TtsSystemError(TtsError):
    pass

class TtsBase(object):
    '''Text to speech Base Class'''
    
    def synthesize(self, text, sound_file_name):
        raise NotImplementedError

    @staticmethod
    def trim(text):
        '''remove leading and trailing spaces'''
        return re.subn(r"^ *| *$", '', text)[0] 

    @staticmethod
    def split_text(text, max_size=100):
        '''split text to suite tts api limitations'''
        more = TtsBase.trim(text)
        while more:
            text = more
            more = ''
            if len(text) > max_size:
                phrases = re.split("[,.()]", text, 1) 
                text = phrases[0]
                if len(phrases) > 1:
                    more = phrases[1]
                if len(text) > max_size:
                    cut = 100
                    while cut and text[cut]!=' ':
                        cut -= 1
                    if cut:
                        text, more = text[:cut], text[cut:] + " " + more
            more = TtsBase.trim(more)
            yield text

    @staticmethod
    def slugify(text):
        '''normalize text making usable in filenames'''
        from unicodedata import normalize
        import re
        max_words = 6
        invalid_chars = r'[^a-zA-Z0-9- ]'

        slug = text.lower()
        slug = normalize('NFKD',unicode(slug,'UTF-8')).encode("ASCII","ignore") # remove accents
        slug = re.subn(invalid_chars, ' ', slug)[0] # remove invalid chars
        slug = re.subn(r"^ *| *$", '', slug)[0]     # trim
        slug = re.subn(r"[ ]{2,}",' ', slug)[0]     # remove double space
        slug = "_".join(slug.split(" ")[:max_words])
        return slug

class GoogleTts(TtsBase):
    '''Text to speech using google API'''
    tts_url = "http://translate.google.com/translate_tts?tl=pt"
    http_useragent = "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.16) Gecko/20110107 Iceweasel/3.5.16 (like Firefox/3.5.16)"
    
    def synthesize(self, text, sound_file_name):
        HTTP_OK = 200

        # synthesize to chunk files to concatenate later
        api = Client()
        api.http_useragent = self.http_useragent
        chunk_list = []
        for t in self.split_text(text):
            temp = mktemp(".mp3", dir="/tmp/")
            url = self.tts_url + "&" + urlencode({"q": t})
            code, content = api.http_req(url, output_file_name=temp)
            chunk_list.append(temp)
            if code!=HTTP_OK:
                raise TtsServerError("TTS::HTTP result code: %i" % code)

        # concatenate and convert downloaded files
        command = 'sox "%s" -r 8000 -c 1 "%s"' % (' '.join(chunk_list), sound_file_name)
        result = os.system(command)
        if result!=0:
            raise TtsSystemError("\n\tTTS::os.system('%s')\n\tTTS::System error %i: %s" % 
                                 (command, result, os.strerror(result)) )
        for tempfile in chunk_list:
            os.unlink(tempfile)

        return result==0
            

if __name__=="__main__":
    import sys
    l = sys.argv
    if len(l) > 1:
        text = ' '.join(sys.argv[1:])
        tts=GoogleTts()
        tts.synthesize(text,"tts.gsm")
