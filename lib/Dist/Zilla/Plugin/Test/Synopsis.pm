use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Test::Synopsis;
# ABSTRACT: Author tests for synopses
# VERSION
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::PrereqSource';

=head1 SYNOPSIS

In C<dist.ini>:

    [Test::Synopsis]

=begin :prelude

=for test_synopsis BEGIN { die "SKIP: synopsis isn't perl code" }

=end :prelude

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/author/synopsis.t - a standard Test::Synopsis test

=cut


# Register the test prereqs as "develop requires"
# so they will be listed in "dzil listdeps --author"
sub register_prereqs {
    my ($self) = @_;

    $self->zilla->register_prereqs(
        {
            type  => 'requires',
            phase => 'develop',
        },
        'Test::Synopsis' => '0',
    );
}


__PACKAGE__->meta->make_immutable;
no Moose;
1;

__DATA__
___[ xt/author/synopsis.t ]___
#!perl

use Test::Synopsis;

all_synopsis_ok();
