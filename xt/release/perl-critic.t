#!/usr/bin/perl -w

use strict;
use warnings;
use Test::More;
 
if (eval {require Test::Perl::Critic}) {
    Test::Perl::Critic->import(
        -severity => 1,
        -exclude => ['RequireRcsKeywords', 'RequireExplicitPackage'],
    );
    Test::Perl::Critic::all_critic_ok();
} else {
    plan skip_all => "couldn't load Test::Perl::Critic";
}
