
$snp_file = $ARGV[0];
$outfile = $ARGV[1];
open SNP, $snp_file;
open OUTFILE, ">$outfile" or die "Could not open $outfile for writing";

my @snp_array = ();


my %data;
while ($line=<SNP>){
    chomp $line;
    my @snp_array = split('\s',$line);
    my $id = $snp_array[5];
    my $value = $snp_array[3];
    $data{$id}{sum} += $value;
    $data{$id}{count}++;
    print STDERR "$snp_array";
}

for my $id (sort keys %data) {
    my $avg = $data{$id}{sum}/$data{$id}{count};
    print STDERR "$id $data{$id}{sum} $data{$id}{count} $avg\n";
    print OUTFILE "$id: sum=$data{$id}{sum} avg=$avg n=$data{$id}{count}\n";
}

	
