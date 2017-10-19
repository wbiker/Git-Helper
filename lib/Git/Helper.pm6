use v6.c;
unit class Git::Helper:ver<0.0.1>;


=begin pod

=head1 NAME

Git::Helper - blah blah blah

=head1 SYNOPSIS

  use Git::Helper;

=head1 DESCRIPTION

Git::Helper is ...

=head1 AUTHOR

wolfgangbanaston <wolfgangbanaston@sophos.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2017 wolfgangbanaston

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

method get-youngest-release-branch(@branches) {
    if @branches.elems == 0 {
        die "Could not find any release branches.";
    }

    my $most-recent-release-branch;
    my $release-year = 0;
    my $release-week = 0;
    for @branches -> $branch-name {
        if $branch-name ~~ /('release/' (\d **4) '.' (\d **2))/ {
            my $year = +$0[0];
            my $week = +$0[1];

            if $year > $release-year || ($year == $release-year && $week > $release-week) {
                $release-year = $year;
                $release-week = $week;
                $most-recent-release-branch = ~$0;
            }
        }
    }
    die "Most recent release branch not found." unless $most-recent-release-branch;
    
    return $most-recent-release-branch;
}
