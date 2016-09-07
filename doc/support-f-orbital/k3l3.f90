program k3l3
  implicit none
  integer,parameter:: nl = 3
  integer:: l1,m1,l2,m2,l3,lk3,ll3,mm1,mm2,lk3c,ll3c
  integer:: dk3, dl3

  dk3 = 0
  dl3 = 0
  lk3c = 0
  do l1=0,nl
     do m1=-l1,l1
        do l2=0,l1
           do m2=-l2,l2
              if (.not. ((l1.eq.l2).and.(m2.gt.m1))) then
                 mm1 = l1*l1 + l1+m1+1
                 mm2 = l2*l2 + l2+m2+1
                 lk3 = (mm1-1)*(mm1-1+1)/2 + mm2
                 lk3c = lk3c + 1
                 ll3 = 0
                 do l3=abs(l1-l2),l1+l2
                    if (mod(l1+l2+l3,2).eq.0) then
                       ll3 = ll3 + 1
                       ll3c = ( l3 - abs(l1-l2) )/2 + 1
                       dk3 = max(dk3,abs(lk3-lk3c))
                       dl3 = max(dl3,abs(ll3-ll3c))
                       write(10,'(i0,1x,i0,1x,i0)') lk3,ll3,l3
                    end if
                 end do
                 write(20,'(i0)') ll3
              end if
           end do
        end do
     end do
  end do
  write(6,*) dk3,dl3

  return
end program k3l3
