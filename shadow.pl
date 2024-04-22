#!/usr/bin/env perl

use 5.030;
use strict;
use warnings;
use Try::Tiny;
use lib "./lib/";
use Shadow::Engine::Stop;
use Shadow::Engine::Start;
use Shadow::Engine::Restart;
use Shadow::Utils::Status;
use Shadow::Utils::Helper;
use Shadow::Utils::Install;

sub main {
    my $argument = $ARGV[0];

    if ($argument) {
        die "Permission denied.\n" if $< != 0;

        my $commands = {
            stop    => "Shadow::Engine::Stop",
            start   => "Shadow::Engine::Start",
            status  => "Shadow::Utils::Status",
            restart => "Shadow::Engine::Restart",
            install => "Shadow::Utils::Install",
            help    => "Shadow::Utils::Helper"
        };

        try {
            my $exec = $commands->{$argument}->new();

            if ($exec ne "1") {
                print $exec;
            }
        }
        catch {
            print "\n[!] ERROR: This command cannot be executed.\n\n";
        };

        return 1;
    }

    return print Shadow::Utils::Helper->new();
}

exit main();
