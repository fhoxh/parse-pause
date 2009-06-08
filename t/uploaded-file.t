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

isa_ok($parsed, 'Parse::PAUSE::Plugin::UploadedFile');
is($parsed->upload(), 'Coat-Persistent-0.104.tar.gz');
is($parsed->pathname(), '$CPAN/authors/id/S/SU/SUKRIA/Coat-Persistent-0.104.tar.gz');
is($parsed->size(), 24105);
is($parsed->md5(), '5f84687ad671b675c6e2936c7b2b3fd7');
is($parsed->entered_by(), 'SUKRIA (Alexis Sukrieh)');
is($parsed->entered_on(), 'Fri, 05 Jun 2009 17:10:00 GMT');
is($parsed->completed(), 'Fri, 05 Jun 2009 17:11:11 GMT');
is($parsed->paused_version(), 1047);

__DATA__
The uploaded file

    Coat-Persistent-0.104.tar.gz

has entered CPAN as

  file: $CPAN/authors/id/S/SU/SUKRIA/Coat-Persistent-0.104.tar.gz
  size: 24105 bytes
   md5: 5f84687ad671b675c6e2936c7b2b3fd7

No action is required on your part
Request entered by: SUKRIA (Alexis Sukrieh)
Request entered on: Fri, 05 Jun 2009 17:10:00 GMT
Request completed:  Fri, 05 Jun 2009 17:11:11 GMT

Thanks,
-- 
paused, v1047
