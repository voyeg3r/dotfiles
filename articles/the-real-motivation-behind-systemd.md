Filename: the-real-motivation-behind-systemd.md
Last Change: Mon, 24 Oct 2022 11:29:50
tags: [systemd, articles]

The real motivation behind systemd

source: https://unixsheikh.com/articles/the-real-motivation-behind-systemd.html

[unixsheikh.com](/index.html)
| [articles only](/articles.html) | [tutorials only](/tutorials.html)
| [about](/about.html) | [faq](/faq.html) | [resources](/resources.html) | [contact](/contact.html) | [rss](/feed.rss)

The real motivation behind systemd
==================================

Published on 2018-05-01. Modified on 2021-02-12.

In this article we're going to take a close look at the real motivation behind the development of systemd, and we're going to take a look at some of the future perspectives for GNU/Linux as an operating system.

### Table of Contents

*   [Introduction](#introduction)
*   [Fact 1: systemd is from Red Hat](#fact1)
*   [Fact 2: The primary reason for developing systemd is Red Hat's business interests in embedded devices](#fact2)
*   [Fact 3: No, it's not a myth, systemd is truly a huge monolith](#fact3)
*   [Fact 4: Privacy concerns](#fact4)
*   [Fact 5: Red Hat wants to become the next Microsoft Windows](#fact5)
*   [Fact 6: Red Hat needs other major Linux distributions to cooperate](#fact6)
*   [Consequences](#consequences)
*   [Final comments](#final)

Introduction
------------

Personally I didn't have a problem with systemd in the beginning, when it was mostly just a new init system. However, my problem with systemd today is that it has turned into a kind of [Trojan horse](https://en.wikipedia.org/wiki/Trojan_horse_%28computing%29). It is an attempt by [Red Hat](https://en.wikipedia.org/wiki/Red_Hat) to change the world of Linux in order to better serve their corporate interests.

While the Linux kernel, the GNU tools and the different major independent Linus distributions all started out as community driven projects, most of the current development in Linux world is motivated by corporate interests, driven by developers sitting in different key positions in different companies, such as Red Hat, Google, Facebook and several others.

Red Hat first disguised their plans by calling systemd an alternative init system. Then the truth was revealed and systemd became "a suite of software that provides fundamental building blocks for a Linux operating system." Red Hat then launched a massive campaign in order to influence all the other major Linux distributions and pressured them to adopt systemd. The effort and work they did seemed rather desperate actually.

The systemd developers addressed several third party projects and tried to convince them to make their projects depend upon systemd, such as the attempts made by Lennart Poettering on [the Gnome mailing list](https://mail.gnome.org/archives/desktop-devel-list/2011-May/msg00427.html), and the attempt made by Red Hat developer "keszybz" on the [tmux project](https://github.com/tmux/tmux/issues/428). Most of these attempts were disguised as technical issues, however when one read the long email correspondence on the Gnome mailing list and elsewhere, the real intent becomes quite clear.

Other tactics deployed by Red Hat was to hire developers from GNOME and other Linux distributions, such as Debian, and then have these people promote systemd.

The latest invention by Lennart Poettering called [systemd-homed](https://systemd.io/HOME_DIRECTORY/) is presented as a new way to handle home directories, whereas it really just is a way to get one step closer to eliminating `/etc`, which is something Red Hat has dreamed about for a long time.

Watch the [FOSSDEM 2020 video](https://www.youtube.com/watch?v=ZYOHvzv2T64) where Poettering presents systemd-homed and notice how he criticizes the way full disk encryption is handled from the point of view that Linux is a multi-user system, yet at the same time he rejects at least five different challenges systemd-homed presents as irrelevant because, well, the laptop is really only used by one single person.

The fact is that the main development in Linux world, even in the kernel, has been almost completely hijacked by major companies. It is no longer mainly community driven development. Linux has become really big bucks for many corporations and they really want to control as much of the development as possible.

One of the results of all of this has been a huge uproar in the open source Linux community in which Debian Developer Joey Hess, Debian Technical Committee members Russ Allbery and Ian Jackson, and systemd package-maintainer Tollef Fog Heen resigned from their positions. All four justified their decision on the public Debian mailing list and in personal blogs with their exposure to extraordinary stress-levels related to ongoing disputes on systemd integration within the Debian and open source community that rendered regular maintenance virtually impossible.

In December 2014 a group calling themselves the "Veteran Unix Admins" announced a fork of Debian called Devuan that intends to provide a Debian variant without systemd. Devuan 1.0.0 was released on May 26, 2017.

> We believe this situation is also the result of a longer process leading to the take-over of Debian by the GNOME project agenda. Considering how far this has propagated today and the importance of Debian as a universal OS and base system in the distribution panorama, what is at stake is the future of GNU/Linux in a scenario of complete homogeneization and lock-in of all base distributions.

Let's take a look at some indisputable facts.

Fact 1: systemd is from Red Hat
-------------------------------

Lennart Poettering and Kay Sievers who started the systemd project in 2010 are both Red Hat employees. Initially systemd was released as a new init system, but it has slowly grown into what Poettering describes as "a suite of software that provides fundamental building blocks for a Linux operating system." This is by design, not by coincidence.

The official reason for the development of systemd was described as:

> They wanted to improve the software framework for expressing dependencies, to allow more processing to be done concurrently or in parallel during system booting, and to reduce the computational overhead of the shell.

Fact 2: The primary reason for developing systemd is Red Hat's business interests in embedded devices
-----------------------------------------------------------------------------------------------------

Red Hats primary business is in embedded devices, and the primary concerns addressed by systemd by design is embedded devices, such as the work towards removing `/etc`.

In an [interview with Red Had CEO Jim Whitehurst](https://linux.slashdot.org/story/17/10/30/0237219/interviews-red-hat-ceo-jim-whitehurst-answers-your-questions) he states:

> We partner with the largest embedded vendors in the world, particularly in the telecom and automotive industries where stability and reliability is the number one concern. They easily adapted to systemd.

Mentor Automotive has released [their slides from a 2015 event](https://events.static.linuxfound.org/sites/events/files/slides/AGL_systemd_2015.pdf) In these slides the many benefits provided by systemd to the embedded automotive market is fairly well explained. The reason why they "easily adapted to systemd" is because systemd is specifically designed to suit their needs.

The U.S. Military has been Red Hats [biggest customer since 2002](/includes/files/Army-RedHat-Whitepaper-February-2014.pdf) and they have been a major source of motivation behind many of Red Hats decisions.

In 2012 Lennart Poettering [changed the systemd license from GPL to LGPL](https://github.com/systemd/systemd/commit/5430f7f2bc7330f3088b894166bf3524a067e3d8) in order to better suit the embedded market.

Fact 3: No, it's not a myth, systemd is truly a huge monolith
-------------------------------------------------------------

In his blog post "The Biggest Myths", from January 2013, Lennart Poettering argue against calling systemd a "monolith", which is what many people consider it to be. Lennart says:

> A package involving 69 individual binaries can hardly be called monolithic. What is different from prior solutions however, is that we ship more components in a single tarball, and maintain them upstream in a single repository with a unified release cycle.

The fact is however, that many of these so-called individual binaries has functionality that simply will not work without other systemd components. If we take a look at the man page for systemd-networkd it clearly states that if you set the option `UseDNS` as `true` the DNS servers received from the DHCP server will be used and take precedence over any statically configured ones. This corresponds to the `nameserver` option in `/etc/resolv.conf`. What the man page neglects to mention is that this setting (and multiple other settings) does not work without systemd-resolved. Other components of systemd are even more tightly integrated.

Fact 4: Privacy concerns
------------------------

systemd-resolved has hard coded fallback DNS servers for Cloudflare, Quad9 and Google. Even if you turn these off, a bug might cause these to be used anyway (which actually happened at one point).

Fact 5: Red Hat wants to become the next Microsoft Windows
----------------------------------------------------------

This is another major motivation at Red Hat and this is illustrated by Lennart Poetterings slides from [FUDCON + GNOME.Asia Beijing 2014](http://0pointer.de/public/gnomeasia2014.pdf). Go to page 15 and scroll slowly forward to page 19. Eventually you end up with the project objectives:

*   Turn Linux from a bag of bits into a competitive General Purpose Operating System.
*   Build the Internet's Next Generation OS.
*   Unifying pointless differences between distributions.
*   Bringing innovation back to the core OS.

Combined with the next set of slides that display the market Red Hat want to target:

*   Desktop
*   Server
*   Container
*   Embedded
*   Mobile
*   Cloud
*   Cluster

Much of the added functionality that the different systemd modules provide has zero benefit in the server industry. It is only added to make desktop systems like GNOME and KDE function like Microsoft Windows.

Fact 6: Red Hat needs other major Linux distributions to cooperate
------------------------------------------------------------------

If Red Hat was ever going to succeed in their long term plans for developing the "Internet's Next Generation OS" they knew they needed to somehow influence the other major Linux distributions. The reason for this is that if a major Linux distribution like Debian was going to reject systemd, Red Hat wouldn't be able to proceed with their plans because too many third party projects simply wouldn't care about how Red Hat would like things to work. This is very important to understand because many open source projects used to develop software with [POSIX](https://en.wikipedia.org/wiki/POSIX) compatibility in mind. As such they try to make sure that their project compiles and works on several Unix-like operating systems. This is something that isn't in the interests of Red Hats. As long as you have to consider other operating systems such as Solaris, FreeBSD, OpenBSD, etc., Linux is "held back" when compared to functionality in Microsoft Windows. Functionality such as easy mounting and unmounting, simple privilege escalation, etc.

Another problem for Red Hat was that if the other major GNU/Linux distributions had rejected systemd, it would have become much more difficult for them to get systemd relevant changes and code pushed into the kernel. But when the other major distributions also adopted systemd, it became a lot easier.

Consequences
------------

The main problem with systemd is that its continued development is motivated by a company's economic interests and not the open source Linux community interests.

Red Hat cannot be trusted from a security point of view and if the U.S. Military, or some other three letter organization, want Red Hat to put a backdoor into systemd, then this can easily go unnoticed for many years, just like it did with the [Heartbleed bug](https://en.wikipedia.org/wiki/Heartbleed).

And we have already seen several examples of these kind of exploitable bugs in systemd:

*   [Create a user called '0day', get root privs - not considered a bug!](https://www.theregister.co.uk/2017/07/05/linux_systemd_grants_root_to_invalid_user_accounts/)
*   [Remote Code Execution For Two Years](https://it.slashdot.org/story/17/07/03/0343258/severe-systemd-bug-allowed-remote-code-execution-for-two-years)
*   [Systemd Bug Lets Attackers Hack Linux Boxes via Malicious DNS Packets](https://www.bleepingcomputer.com/news/security/systemd-bug-lets-attackers-hack-linux-boxes-via-malicious-dns-packets/<Paste>)

Whether such bugs are introduced into the code on purpose, disguised as honest mistakes, or they truly are real mistakes, is impossible to tell. But one thing is very clear, Red Had do not have the Linux communities best interests at heart, they only have their own financial interests at heart.

Another major problem is the previously mentioned hard coded DNS servers in systemd-resolved.

Lennart Poettering [explained](https://github.com/systemd/systemd/issues/494) that the hard coded values should be there in case of catastrophic failure of configuration files, and a lack of DHCP on the network (the DNS fallback is changeable but requires a recompile). However, that's the "embedded developer" speaking. If a bug is found in the application that makes these DNS servers run even though you have disabled them, or if a [race issue bug is found](https://github.com/systemd/systemd/issues/4175), you could be facing a serious privacy issue. Furthermore running with Cloudflare, Quad9, and Google DNS servers hard coded into the systemd code is deeply problematic as these companies are not only known for violating peoples privacy, but also because NSA has previously infiltrated Googles data centers, something revealed [by the Snowden documents](https://www.washingtonpost.com/world/national-security/nsa-infiltrates-links-to-yahoo-google-data-centers-worldwide-snowden-documents-say/2013/10/30/e51d661e-4166-11e3-8b74-d89d714ca4dd_story.html). Such settings should never be opt-out (where you have to remember to remove them), they should be opt-in, and definitely not the default options.

The way these issues are dealt with generally, and the extremely arrogant attitude of Lennart Poettering shows a complete disregard for user privacy and for the interests of the open source Linux community.

Final comments
--------------

It has surprised me that the initial discussion on the Debian mailing list somehow managed to only address SysVinit, Upstart and systemd. Nobody took a serious look at [runit](http://smarden.org/runit/) or [s6](https://skarnet.org/software/s6/). Not only are these systems much more aligned with the Unix philosophy, but they are also much more secure and easy to understand.

Casper Ti. Vectors post on the Gentoo forum, [s6/s6-rc vs systemd, or why you probably do not need systemd](https://forums.gentoo.org/viewtopic-t-1105854.html), also shows that s6 is a better and in many ways superior solution to systemd.

Many people mistakenly think that each and every systemd component is independent, but that's just not true. Take a look at the code and the documentation and see the [tight integration](https://www.freedesktop.org/wiki/Software/systemd/InterfacePortabilityAndStabilityChart/) between many of these so-called modules.

Corporate politics, maneuvers and manipulations has no place in the community driven open source projects. And while companies can be allowed to both use open source code, contribute code and also provide financial support from their earnings on these projects, they should never be allowed such massive control as Red Hat and others now have.

Thank God for truly independent community driven projects, because without those we're left with crap like Microsoft Windows. On that note, take a look at:

*   [OpenBSD is fantastic](https://unixsheikh.com/articles/openbsd-is-fantastic.html)
*   [FreeBSD is an amazing operating system](https://unixsheikh.com/articles/freebsd-is-an-amazing-operating-system.html)
*   [Technical reasons to choose FreeBSD over GNU/Linux](https://unixsheikh.com/articles/technical-reasons-to-choose-freebsd-over-linux.html)
*   [Some of the great GNU/Linux distributions](https://unixsheikh.com/articles/some-of-the-great-gnu-linux-distributions.html)
*   [Lennart Poettering: BSD Isn't Relevant Anymore](https://bsd.slashdot.org/story/11/07/16/0020243/lennart-poettering-bsd-isnt-relevant-anymore)

_If you have any comments or corrections please feel free to email them to me. Also, if you found any of the content on this website useful consider supporting me on [Patreon](https://patreon.com/unixsheikh)_ ;)

