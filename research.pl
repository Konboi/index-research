use DBI;
use DBD::mysql;
use Benchmark qw/timethese cmpthese/;

my $d = 'DBI:mysql:index_research';
my $u = 'root';
my $p = '';
my $dbh = DBI->connect($d, $u, $p);

my $result = timethese(10, {
    'player_id index_id use no index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM no_index WHERE player_id = $player_id  AND index_id = $id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id index_id use player_id index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM one_index WHERE player_id = $player_id  AND index_id = $id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id index_id use player_id index_id index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM both_index WHERE player_id = $player_id  AND index_id = $id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id index_id use uniq index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM uniq_index WHERE player_id = $player_id  AND index_id = $id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
});

cmpthese $result;


my $result_only_player_id = timethese(10, {
    'player_id use no index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM no_index WHERE player_id = $player_id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id use player_id index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM one_index WHERE player_id = $player_id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id use player_id index_id index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM both_index WHERE player_id = $player_id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
    'player_id use uniq index' => sub {
        for my $id (1..100) {
            my $player_id = $id * 20;
            my $sql = "SELECT * FROM uniq_index WHERE player_id = $player_id";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    },
});

cmpthese $result_only_player_id;
