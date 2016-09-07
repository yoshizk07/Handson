maxL3eq1 ()
{
   i=$1
   awk "{if (\$1==$i && \$2==1) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l31=`cat tmp-l3`
   echo "l31 = $l31"
   rm -f temp.mac
   rm -f temp.f90 temp2.f90
   rm -f temp temp2
   sed -f oneline.sed < qy.f90 | grep "qy(ig,$i," > temp
   sed -e "s/^ *qy(ig,$i,\([1-4]\)) *= */\1:/" temp | awk -F: '{printf("qy%d=\"%s\"\n",$1,$2)}' > temp2
   ( qy1=0; qy2=0; qy3=0; qy4=0; . ./temp2 ;
     cat <<EOF >>temp.mac
qy1(x,y,z):= %i^($l31)*$qy1;
EOF
   )
   echo "load(f90);" >> temp.mac
   cat <<EOF >> temp.mac
with_stdout("temp.f90",f90(
sqy(ig,1,1)=diff(qy1(x,y,z),x),
sqy(ig,2,1)=diff(qy1(x,y,z),y),
sqy(ig,3,1)=diff(qy1(x,y,z),z)));
EOF
   cat <<EOF >> temp.mac
with_stdout("temp2.f90",f90(
qy(ig,1)=qy1(x,y,z)));
EOF
   maxima -q -b temp.mac
#
   cat <<EOF >> getsqy.f90
case ($i)
mll3=1
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp.f90 >> getsqy.f90
   echo "end do" >> getsqy.f90
#
   cat <<EOF >> getqy.f90
case ($i)
mll3=1
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp2.f90 >> getqy.f90
   echo "end do" >> getqy.f90
}

maxL3eq2 ()
{
   i=$1
   awk "{if (\$1==$i && \$2==1) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l31=`cat tmp-l3`
   echo "l31 = $l31"
   awk "{if (\$1==$i && \$2==2) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l32=`cat tmp-l3`
   echo "l32 = $l32"
   rm -f temp.mac
   rm -f temp.f90 temp2.f90
   rm -f temp temp2
   sed -f oneline.sed < qy.f90 | grep "qy(ig,$i," > temp
   sed -e "s/^ *qy(ig,$i,\([1-4]\)) *= */\1:/" temp | awk -F: '{printf("qy%d=\"%s\"\n",$1,$2)}' > temp2
   ( qy1=0; qy2=0; qy3=0; qy4=0; . ./temp2 ;
     cat <<EOF >>temp.mac
qy1(x,y,z):= %i^($l31)*$qy1;
qy2(x,y,z):= %i^($l32)*$qy2;
EOF
   )
   echo "load(f90);" >> temp.mac
   cat <<EOF >> temp.mac
with_stdout("temp.f90",f90(
sqy(ig,1,1)=diff(qy1(x,y,z),x),
sqy(ig,2,1)=diff(qy1(x,y,z),y),
sqy(ig,3,1)=diff(qy1(x,y,z),z),
sqy(ig,1,2)=diff(qy2(x,y,z),x),
sqy(ig,2,2)=diff(qy2(x,y,z),y),
sqy(ig,3,2)=diff(qy2(x,y,z),z)));
EOF
   cat <<EOF >> temp.mac
with_stdout("temp2.f90",f90(
qy(ig,1)=qy1(x,y,z),
qy(ig,2)=qy2(x,y,z)));
EOF
   maxima -q -b temp.mac
#
   cat <<EOF >> getsqy.f90
case ($i)
mll3=2
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp.f90 >> getsqy.f90
   echo "end do" >> getsqy.f90
#
   cat <<EOF >> getqy.f90
case ($i)
mll3=2
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp2.f90 >> getqy.f90
   echo "end do" >> getqy.f90
}

maxL3eq3 ()
{
   i=$1
   awk "{if (\$1==$i && \$2==1) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l31=`cat tmp-l3`
   echo "l31 = $l31"
   awk "{if (\$1==$i && \$2==2) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l32=`cat tmp-l3`
   echo "l32 = $l32"
   awk "{if (\$1==$i && \$2==3) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l33=`cat tmp-l3`
   echo "l33 = $l33"
   rm -f temp.mac
   rm -f temp.f90 temp2.f90
   rm -f temp temp2
   sed -f oneline.sed < qy.f90 | grep "qy(ig,$i," > temp
   sed -e "s/^ *qy(ig,$i,\([1-4]\)) *= */\1:/" temp | awk -F: '{printf("qy%d=\"%s\"\n",$1,$2)}' > temp2
   ( qy1=0; qy2=0; qy3=0; qy4=0; . ./temp2 ;
     cat <<EOF >>temp.mac
qy1(x,y,z):= %i^($l31)*$qy1;
qy2(x,y,z):= %i^($l32)*$qy2;
qy3(x,y,z):= %i^($l33)*$qy3;
EOF
   )
   echo "load(f90);" >> temp.mac
   cat <<EOF >> temp.mac
with_stdout("temp.f90",f90(
sqy(ig,1,1)=diff(qy1(x,y,z),x),
sqy(ig,2,1)=diff(qy1(x,y,z),y),
sqy(ig,3,1)=diff(qy1(x,y,z),z),
sqy(ig,1,2)=diff(qy2(x,y,z),x),
sqy(ig,2,2)=diff(qy2(x,y,z),y),
sqy(ig,3,2)=diff(qy2(x,y,z),z),
sqy(ig,1,3)=diff(qy3(x,y,z),x),
sqy(ig,2,3)=diff(qy3(x,y,z),y),
sqy(ig,3,3)=diff(qy3(x,y,z),z)));
EOF
   cat <<EOF >> temp.mac
with_stdout("temp2.f90",f90(
qy(ig,1)=qy1(x,y,z),
qy(ig,2)=qy2(x,y,z),
qy(ig,3)=qy3(x,y,z)));
EOF
   maxima -q -b temp.mac
#
   cat <<EOF >> getsqy.f90
case ($i)
mll3=3
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp.f90 >> getsqy.f90
   echo "end do" >> getsqy.f90
#
   cat <<EOF >> getqy.f90
case ($i)
mll3=3
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp2.f90 >> getqy.f90
   echo "end do" >> getqy.f90
}

maxL3eq4 ()
{
   i=$1
   awk "{if (\$1==$i && \$2==1) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l31=`cat tmp-l3`
   echo "l31 = $l31"
   awk "{if (\$1==$i && \$2==2) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l32=`cat tmp-l3`
   echo "l32 = $l32"
   awk "{if (\$1==$i && \$2==3) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l33=`cat tmp-l3`
   echo "l33 = $l33"
   awk "{if (\$1==$i && \$2==4) {print \$3}}" K3_L3_l3.dat > tmp-l3
   l34=`cat tmp-l3`
   echo "l34 = $l34"
   rm -f temp.mac
   rm -f temp.f90 temp2.f90
   rm -f temp temp2
   sed -f oneline.sed < qy.f90 | grep "qy(ig,$i," > temp
   sed -e "s/^ *qy(ig,$i,\([1-4]\)) *= */\1:/" temp | awk -F: '{printf("qy%d=\"%s\"\n",$1,$2)}' > temp2
   ( qy1=0; qy2=0; qy3=0; qy4=0; . ./temp2 ;
     cat <<EOF >>temp.mac
qy1(x,y,z):= %i^($l31)*$qy1;
qy2(x,y,z):= %i^($l32)*$qy2;
qy3(x,y,z):= %i^($l33)*$qy3;
qy4(x,y,z):= %i^($l34)*$qy4;
EOF
   )
   echo "load(f90);" >> temp.mac
   cat <<EOF >> temp.mac
with_stdout("temp.f90",f90(
sqy(ig,1,1)=diff(qy1(x,y,z),x),
sqy(ig,2,1)=diff(qy1(x,y,z),y),
sqy(ig,3,1)=diff(qy1(x,y,z),z),
sqy(ig,1,2)=diff(qy2(x,y,z),x),
sqy(ig,2,2)=diff(qy2(x,y,z),y),
sqy(ig,3,2)=diff(qy2(x,y,z),z),
sqy(ig,1,3)=diff(qy3(x,y,z),x),
sqy(ig,2,3)=diff(qy3(x,y,z),y),
sqy(ig,3,3)=diff(qy3(x,y,z),z),
sqy(ig,1,4)=diff(qy4(x,y,z),x),
sqy(ig,2,4)=diff(qy4(x,y,z),y),
sqy(ig,3,4)=diff(qy4(x,y,z),z)));
EOF
   cat <<EOF >> temp.mac
with_stdout("temp2.f90",f90(
qy(ig,1)=qy1(x,y,z),
qy(ig,2)=qy2(x,y,z),
qy(ig,3)=qy3(x,y,z),
qy(ig,4)=qy4(x,y,z)));
EOF
   maxima -q -b temp.mac
#
   cat <<EOF >> getsqy.f90
case ($i)
mll3=4
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp.f90 >> getsqy.f90
   echo "end do" >> getsqy.f90
#
   cat <<EOF >> getqy.f90
case ($i)
mll3=4
do ig=ist,nkc
x=gk(1,ig)
y=gk(2,ig)
z=gk(3,ig)
r=gk(4,ig)
x=x/r
y=y/r
z=z/r
EOF
   cat temp2.f90 >> getqy.f90
   echo "end do" >> getqy.f90
}

gfortran k3l3.f90 -o k3l3
./k3l3
mv fort.10 K3_L3_l3.dat
mv fort.20 K3_maxL3.dat

rm -f getsqy.f90 getqy.f90
echo "select case(k3)" > getsqy.f90
echo "select case(k3)" > getqy.f90

for ii in `seq 136`; do
    maxL3=`sed -e "$ii!d" K3_maxL3.dat`
    case $maxL3 in
	1)
	    maxL3eq1 $ii
	    ;;
	2)
	    maxL3eq2 $ii
	    ;;
	3)
	    maxL3eq3 $ii
	    ;;
	4)
	    maxL3eq4 $ii
	    ;;
    esac
done

echo "end select" >> getsqy.f90
echo "end select" >> getqy.f90

sed -f oneline-sqrt.sed getqy.f90 > getqy-one.f90
sed -f oneline-sqrt.sed getsqy.f90 > getsqy-one.f90
