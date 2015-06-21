use DBI;
use DBD::mysql;

my $d = 'DBI:mysql:index_research';
my $u = 'root';
my $p = '';
my $dbh = DBI->connect($d, $u, $p);

for my $table ('no_index', 'one_index', 'both_index') {
    for my $player_id (1..2000) {
        for my $index_id (1..100) {
            my $sql = "INSERT INTO  $table (player_id, index_id) VALUES ($player_id, $index_id)";
            my $sth = $dbh->prepare($sql);
            $sth->execute;
            $sth->finish;
        }
    }
}
$dbh->disconnect;
