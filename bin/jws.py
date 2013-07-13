#!/usr/bin/env python
# -*- coding: utf-8 -*-
#    Just Wanna Say - Say what you types using google translate engine
#    Copyright (C) 2011 Thomaz de Oliveira dos Reis
#    Copyright (C) 2011 Dirley Rodrigues
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

import ctypes
import hashlib
import optparse
import os
import sys
import tempfile
import time
import urllib
import urllib2


class Loader(object):
    def load(self, text, language):
        raise NotImplementedError


class Storage(object):
    def store(self, identifier, fp):
        raise NotImplementedError

    def retrieve(self, identifier):
        """ Should raise ``Exception`` if not found.
        TODO: specialized exception """
        raise NotImplementedError

    def release(self, identifier):
        """ Release a identified file if it was stored here.
        TODO: specialized exception """
        raise NotImplementedError


class Backend(object):
    named_file_required = None

    def __init__(self, *args):
        pass

    def play(self, fp):
        raise NotImplementedError
   
    @staticmethod
    def available():
        """ Subclasses must extend this method to tell the caller if they are
        available for use or not. """
        return True

    @classmethod
    def name(cls):
        return cls.__name__[:-len('_backend')]

    @classmethod
    def info(cls):
        return cls.__doc__.strip()

    @classmethod
    def availability_info(cls):
        doc = cls.available.__doc__
        if not doc is Backend.available.__doc__:
            return doc.strip()

class DefaultLoader(Loader):
    def load(self, text, language):
        """ ``text`` must be unicode. ``language`` doesn't. """
        data = {
            'tl': language,
            'q': text.encode(sys.stdin.encoding or 'utf-8'),
        }

        url = 'http://translate.google.com/translate_tts?' + urllib.urlencode(data)
        request = urllib2.Request(url)
        request.add_header('User-Agent', 'Mozilla/5.0')

        webfile = urllib2.urlopen(request)
        return webfile


class TempfileStorage(Storage):
    fmap = {}

    def store(self, identifier, fp):
        tf = open(tempfile.mktemp(suffix='.mp3'), 'wb')
        tf.write(fp.read())
        tf.close()

        self.fmap[identifier] = tf.name

        return self.retrieve(identifier)

    def retrieve(self, identifier):
        fp = None
        fname = self.fmap.get(identifier)
        if fname is not None:
            try:
                fp = open(fname, 'rb')
            except OSError:
                pass
        if fp is None:
            raise Exception('Not found')
        return fp

    def release(self, identifier):
        fname = self.fmap.get(identifier)
        if fname is not None:
            os.unlink(fname)

class appkit_backend(Backend):
    """ An Apple's AppKit powered backend. """
    named_file_required = True

    def play(self, fp):
        from AppKit import NSSound
        sound = NSSound.alloc()
        sound.initWithContentsOfFile_byReference_(fp.name, True)
        sound.play()
        while sound.isPlaying():
          time.sleep(1)

    @classmethod
    def available(cls):
        """ Requires Apple AppKit available on MacOS X. """
        if not hasattr(cls,"_available"):
            try:
                import AppKit
            except ImportError:
                cls._available = False
            else:
                cls._available = True 

        return cls._available

class stdout_backend(Backend):
    """ A backend that prints the output to stdout. """
    def play(self, fp):
        print fp.read()


class external_backend(Backend):
    """ A backend that uses a external program to play the audio. """
    named_file_required = True

    def __init__(self, command=""):
        if not command:
           command = self.autodetect_external_program()
        self.command = command
    
    @staticmethod
    def autodetect_external_program():
        external_programs = (
            ('mpg123', 'mplayer %s >/dev/null 2>&1'),
            ('playsound', 'playsound %s >/dev/null 2>&1'),
            ('mplayer', 'mplayer %s >/dev/null 2>&1'),
        )
        def is_exe(fpath):
            return os.path.exists(fpath) and os.access(fpath, os.X_OK)

        for program, command in external_programs:
            for path in os.environ['PATH'].split(os.pathsep):
                if is_exe(os.path.join(path, program)):
                    return command

    def play(self, fp):
        command = self.command
        if not '%s' in self.command:
            command = self.command + ' %s'
        os.system(command % (fp.name,))


class defaultapp_backend(external_backend):
    """ Try to use your default application as backend. """
    def __init__(self, *args):
        cmd = {'darwin': 'open %s',
               'win32': 'cmd /c "start %s"',
               'linux2': 'xdg-open %s'}.get(sys.platform)
        super(defaultapp_backend, self).__init__(cmd)


class pyaudio_backend(Backend):
    """ A PortAudio and PyMAD powered backend. """

    def play(self, fp):
        import mad, pyaudio

        mf = mad.MadFile(fp)

        # open stream
        p = pyaudio.PyAudio()
        stream = p.open(format=p.get_format_from_width(pyaudio.paInt32),
                channels=2, rate=mf.samplerate(), output=True)

        data = mf.read()
        while data != None:
            stream.write(data)
            data = mf.read()

        stream.close()
        p.terminate()

    @classmethod
    def available(cls):
        """ Requires PyMad (http://spacepants.org/src/pymad/) and PyAudio (http://people.csail.mit.edu/hubert/pyaudio/). """
        if not hasattr(cls,"_available"):
            try:
                import mad, pyaudio
            except ImportError:
                cls._available = False
            else:
                cls._available = True 

        return cls._available

class ao_backend(Backend):
    """A LibAO and PyMAD powered backend. """

    def __init__(self, backend=None):
        self.backend = backend

    def play(self, fp):
        import mad, ao

        backend = self.backend
        if backend is None:
            import sys
            backend = {
                'darwin': 'macosx',
                'win32': 'wmm',
                'linux2': 'alsa'
            }.get(sys.platform)

        if backend is None:
            raise Exception("Can't guess a usable libao baceknd."
                            "If you know a backend that may work on your system then"
                            "you can specify it using the backend options parameter.")

        mf = mad.MadFile(fp)
        dev = ao.AudioDevice(backend)

        while True:
            buf = mf.read()
            if buf is None:
                break
            dev.play(buf, len(buf))

    @classmethod
    def available(cls):
        """ Requires PyMad (http://spacepants.org/src/pymad/) and PyAO (http://ekyo.nerim.net/software/pyogg/). """
        if not hasattr(cls,"_available"):
            try:
                import mad,ao
            except ImportError:
                cls._available = False
            else:
                cls._available = True 

        return cls._available

class Win32AudioClip(object):
    """ A simple win32 audio clip. Inspired by mp3play (http://pypi.python.org/pypi/mp3play/) """

    def __init__(self, fname):
        self._alias = 'mp3_%s' % (id(self),)
        self._mci = ctypes.windll.winmm.mciSendStringA
        self._send(r'open "%s" alias %s' % (fname, self._alias))
        self._send('set %s time format milliseconds' % (self._alias,))
        length = self._send('status %s length' % (self._alias,))
        self._length = int(length)

    def _send(self, command):
        buf = ctypes.c_buffer(255)
        ret = self._mci(str(command), buf, 254, 0)
        if ret:
            err = int(ret)
            err_buf = ctypes.c_buffer(255)
            self._mci(err, err_buf, 254)
            raise RuntimeError("Error %d: %s" % (err, err_buf.vale))
        else:
            return buf.value

    def play(self):
        self._send('play %s from %d to %d' % (self._alias, 0, self._length))

    def isplaying(self):
        return 'playing' == self._send('status %s mode' % self._alias)

    def __del__(self):
        self._send('close %s' % (self._alias,))


class win32_backend(Backend):
    """ The simplest backend available for Windows XP """
    named_file_required = True

    def play(self, fp):
        clip = Win32AudioClip(fp.name)
        clip.play()
        while clip.isplaying():
            time.sleep(1)

    @classmethod
    def available(cls):
        """ Runs on Windows XP or newer (?) """
        return sys.platform == 'win32'


def autodetect_backend():
    # test for win32 backend
    if win32_backend.available():
        return win32_backend()

    # test for appkit
    if appkit_backend.available():
        return appkit_backend()

    # test for pyaudio
    if pyaudio_backend.available():
        return pyaudio_backend()

    # test for external programs
    cmd = external_backend.autodetect_external_program()
    if cmd is not None:
        return external_backend(cmd)

    # test for ao
    if ao_backend.available():
        return ao_backend()

    # using default app as backend
    print (u'No backend was found. Trying to play'
           u' using your default application')
    return defaultapp_backend()


def installed_backends():
    """ Return installed backends, classified in available or unavailable. """
    # TODO: return in the order they are autodetected
    def recursive_backends(classes):
        result = classes
        for cls in classes:
            result += recursive_backends(cls.__subclasses__())
        return result
        
    backends = recursive_backends(Backend.__subclasses__())
    available = tuple(cls for cls in backends if cls.available())
    unavailable = tuple(cls for cls in backends if not cls.available())
    return available, unavailable


def backends_help(extended=True):
    available, unavailable = installed_backends()

    print u'Available backends:'
    for backend in available:
        print '%s %s' % (backend.name().ljust(20), backend.info())

    if not extended: return

    print
    print u'Unavailable backends:'
    for backend in unavailable:
        print '%s %s \n %s' % (backend.name().ljust(20), backend.info(), " "*20+backend.availability_info())

    print
    print (u'To use the unavailable backends you must first supply their dependencies')


def main():
    about= (u"Just Wanna Say [Version 2.1]  Copyright (C) 2011 Thomaz Reis and Dirley Rodrigues"
           u"\nThis program comes with ABSOLUTELY NO WARRANTY;"
           u"\nThis is free software, and you are welcome to redistribute it under certain conditions;") 

    usage = 'usage: %prog [options] [phrases]'
    option_list = [
        optparse.make_option('-h', '--help', action='store_true',
            dest='help', default=False, help=u'Show this help.'),
        optparse.make_option('--list-backends', action='store_true',
            dest='list_backends', default=False,
            help=u'List all installed backends.'),
        optparse.make_option('-l', '--language', action='store',
            type='string', dest='language', default='pt',
            help=u'Change the input language.'),
        optparse.make_option('-b', '--backend', action='store',
            type='string', dest='backend', default=None,
            help=u'Specify the audio output mean.'),
        optparse.make_option('-o', '--backend-options', action='store',
            type='string', dest='backend_options', default=None,
            help=u'Options to be passed to the backend.'), 
    ]
    parser = optparse.OptionParser(usage=usage, option_list=option_list, add_help_option=False)

    options, arguments = parser.parse_args()

    if options.help:
        print about
        parser.print_help()
        print
        backends_help(options.list_backends)
        return
    elif options.list_backends:
        print about
        print
        backends_help(True)
        return
    elif not arguments:
        print about
        print
        print u'No arguments specified. Please, try -h or --help for usage information.'
        return

    if options.backend is not None:
        backend = globals().get('%s_backend' % (options.backend.lower(),))(options.backend_options)
    elif options.backend_options is not None:
        print u'You specified backend options but no backend.'
        return
    else:
        backend = autodetect_backend()

    text = u' '.join([i.decode(sys.stdin.encoding or 'utf-8') for i in arguments])

    #Just Wanna Have Fun :)
    if text == "Does JWS has any easter eggs?":
       if options.language == "pt":
           text = u"Infelizmente não tem nenhum ister égui nesse programa."
       else:
           text = u"Unfortunately there is no easter egg in this program."
           
    loader = DefaultLoader()
    lfp = loader.load(text, options.language)

    if backend.named_file_required:
        identifier = hashlib.md5(':'.join([options.language, text.encode('utf-8')])).hexdigest()

        storage = TempfileStorage()
        fp = storage.store(identifier, lfp)
        lfp.close()

        backend.play(fp)

        fp.close()
    else:
        backend.play(lfp)
        lfp.close()


if __name__ == '__main__':
    main()
