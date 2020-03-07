#!/usr/bin/perl
#
# Usage: make_sre.pl <path-to-data> <name-of-source> <output-dir> <channel-info-file>

if (@ARGV != 2) {
  print STDERR "Usage: $0 <path-to-data> <output-dir> \n";
  print STDERR "e.g. $0 /export/corpora5/LDC/LDC2006S44 data/sre2004 \n";
  exit(1);
}

($db_base, $out_dir) = @ARGV;

$tmp_dir = "$out_dir/tmp";
if (system("mkdir -p $tmp_dir") != 0) {
  die "Error making directory $tmp_dir";
}

if (system("find $db_base -name '*.wav' > $tmp_dir/sph.list") != 0) {
  die "Error getting list of sph files";
}
my %channel_dict = ();
# open(WAVLIST, "<", "$tmp_dir/sph.list") or die "cannot open wav list";
open my $wavlist, "$tmp_dir/sph.list" or die "Could not open $file: $!";

open(SPKR,">", "$out_dir/utt2spk") or die "Could not open the output file $out_dir/utt2spk";
open(WAV,">", "$out_dir/wav.scp") or die "Could not open the output file $out_dir/wav.scp";

while (<$wavlist>) {
	chomp;


	my @arr = split("/", $_);
	# print("@arr[-1]\n");
	my @arr2 = split("\\.", $arr[-1]);
	
	$utt_id = @arr2[0];

	print "utt id : $utt_id\n";
	# print "channels : $channels_in_file","\n";

	$channel_in_reco2file = "0";
	$spk_id = $utt_id;
	$full_utt_id = "$utt_id";
	print WAV "$full_utt_id"," $_ |\n";
	print SPKR "$full_utt_id $spk_id","\n";


}

if (system("perl utt2spk_to_spk2utt.pl $out_dir/utt2spk > $out_dir/spk2utt") != 0){
   die "Could not create spk2utt from utt2spk"
}
if (system("utils/fix_data_dir.sh $out_dir") != 0) {
  die "Error fixing data dir $out_dir";
}

close(SPKR) || die;
close(WAV) || die;
close($wavlist) || die;
