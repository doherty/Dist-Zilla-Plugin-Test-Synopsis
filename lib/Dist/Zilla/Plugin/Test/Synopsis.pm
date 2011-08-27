use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Test::Synopsis;
# ABSTRACT: Release tests for synopses
# VERSION
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

=head1 SYNOPSIS

In C<dist.ini>:

    [Test::Synopsis]

=for test_synopsis
1;
__END__

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/synopsis.t - a standard Test::Synopsis test

=cut

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__DATA__
___[ xt/release/synopsis.t ]___
#!perl

use Test::More;

eval "use Test::Synopsis";
plan skip_all => "Test::Synopsis required for testing synopses"
  if $@;
all_synopsis_ok('lib');
