#!/usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 9;
use Parse::PAUSE;

my $data;

{
    local undef $/;
    $data = <DATA>;
}

my $parsed = Parse::PAUSE->parse($data);

isa_ok($parsed, 'Parse::PAUSE::Plugin::URL');
is($parsed->upload(), 'http://voltar.org/PerlModules/Net-IMAP-Simple-1.1800.tar.gz');
is($parsed->pathname(), '$CPAN/authors/id/J/JE/JETTERO/Net-IMAP-Simple-1.1800.tar.gz');
is($parsed->size(), 11608);
is($parsed->md5(), '9518f5e567123f02b8328082df61a4c6');
is($parsed->entered_by(), 'JETTERO (Paul Miller)');
is($parsed->entered_on(), 'Fri, 05 Jun 2009 18:14:25 GMT');
is($parsed->completed(), 'Fri, 05 Jun 2009 18:14:40 GMT');
is($parsed->paused_version(), 1047);

__DATA__
The URL

    http://voltar.org/PerlModules/Net-IMAP-Simple-1.1800.tar.gz

has entered CPAN as

  file: $CPAN/authors/id/J/JE/JETTERO/Net-IMAP-Simple-1.1800.tar.gz
  size: 11608 bytes
   md5: 9518f5e567123f02b8328082df61a4c6

No action is required on your part
Request entered by: JETTERO (Paul Miller)
Request entered on: Fri, 05 Jun 2009 18:14:25 GMT
Request completed:  Fri, 05 Jun 2009 18:14:40 GMT

Thanks,
-- 
paused, v1047
