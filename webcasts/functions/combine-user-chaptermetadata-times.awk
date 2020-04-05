BEGIN {
	FS="=";OFS="=";n=0;s=0;e=0;tb=1000
}
FNR==NR {
	if($1=="title"){
	       	if(t!="") {
			a[n]=t
		}
		$1="";
		t=$0
	} else if($1 ~ /slide/) {
       		n+=1
	}
       	next
}
{
	a[n]=t
}
{
	e+=$0;
	if (a[FNR]) {
		printf "[CHAPTER]\nTIMEBASE=1/%d\nSTART=%d\nEND=%d\ntitle%s\n",tb, s*tb, e*tb-1,a[FNR];
	       	s=e
	}
}
