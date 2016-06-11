use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::SynopsisTests;
# ABSTRACT: Release tests for synopses
# VERSION
use Moose;
extends 'Dist::Zilla::Plugin::Test::Synopsis';

=head1 SYNOPSIS

In C<dist.ini>:

    [Test::Synopsis]

=begin :prelude

=for test_synopsis BEGIN { die "SKIP: synopsis isn't perl code" }

=end :prelude

=cut

before register_component => sub {
    warn '!!! [SynopsisTests] is deprecated and will be removed in a future release; replace it with [Test::Synopsis]';
};

__PACKAGE__->meta->make_immutable;
no Moose;
1;
