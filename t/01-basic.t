use v6.c;
use Test;
use Git::Helper;

use-ok 'Git::Helper', "Use works";

my @test-branch-names = <
bugfix/CDP-4281
bugfix/CDP-5665-tamperprotection-fix-for-release41
develop
feature/DPFEE-383
feature/DPFEE-736-refactor-reboot-code-in-lightning
release/2017.41
remotes/origin/Bugfix/CWIFI-5051
remotes/origin/CPLAT-19980-json
remotes/origin/DT-22
remotes/origin/XGE/XGE_2216
remotes/origin/bugfix/CDP-3205
remotes/origin/bugfix/CEND-1119-2
remotes/origin/bugfix/CEND-1119-3
remotes/origin/bugfix/CPLAT-17783-stop-calling-hub-api-to-create-admin
remotes/origin/bugfix/CPLAT-17783
remotes/origin/bugfix/CSRV-0000-default-policy-dc-blocked
remotes/origin/release-2017.17
remotes/origin/release/1.2.0
remotes/origin/release/2016.41
remotes/origin/release/2016.46
remotes/origin/release/2016.49
remotes/origin/release/2016.52
remotes/origin/release/2017.08
remotes/origin/release/2017.11
remotes/origin/release/2017.17

remotes/origin/release/2017.20
remotes/origin/release/2017.23
remotes/origin/release/2017.26
remotes/origin/release/2017.29
remotes/origin/release/2017.31
remotes/origin/release/2017.32
remotes/origin/release/2017.35
remotes/origin/release/2017.38
remotes/origin/release/2017.41
remotes/origin/release/2016.49
>;

my $gh = Git::Helper.new;
is $gh.get-youngest-release-branch(@test-branch-names), "release/2017.41", "Latest release found";

dies-ok {$gh.get-youngest-release-branch()}, "No parameter throws exception";
dies-ok {$gh.get-youngest-release-branch(['',''])}, "No youngest build found exception";

done-testing;
