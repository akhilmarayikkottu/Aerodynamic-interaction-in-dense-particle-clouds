PROGRAM BED
IMPLICIT NONE

INTEGER :: i,j,k,T
DOUBLE PRECISION :: Xcm,Ycm,Zcm,Xd,Yd,Zd
DOUBLE PRECISION :: N(3),V(3)
CHARACTER        :: C(5)

OPEN(10,FILE="Bed.dat",FORM="FORMATTED")
!OPEN(20,FILE="Monomer.stl",FORM="FORMATTED")
OPEN(30,FILE="BED.stl",FORM="FORMATTED")

WRITE(*,*) " Number of monomers?"
READ (*,*) T
WRITE(*,*) " Xd?"
READ (*,*) Xd
WRITE(*,*) " Yd?"
READ (*,*) Yd
WRITE(*,*) " Zd?"
READ (*,*) Zd

DO 1 i = 1,T
READ(10,*) Xcm,Ycm,Zcm
OPEN(20,FILE="Monomer.stl",FORM="FORMATTED")
Xcm = Xcm+Xd
Ycm = Ycm+Yd
Zcm = Zcm+Zd
 READ (20,*)
 WRITE(30,*)"solid GEOM" 
 DO 2 j = 1,192
  READ (20,*) C(1),C(2),N(1),N(2),N(3)
  WRITE(30,*) "facet normal", N(1),N(2),N(3)
  READ (20,*) 
  WRITE(30,*) "outer loop"
     DO 3 k = 1,3
       READ(20,*) C(3),V(1),V(2),V(3)
       V(1) = V(1)+Xcm
       V(2) = V(2)+Ycm
       V(3) = V(3)+Zcm
       WRITE(30,*) "vertex",V(1),V(2),V(3)
     3 CONTINUE 
 READ (20,*)
 WRITE(30,*) "end loop"
 READ (20,*)
 WRITE(30,*) "end facet"
 2 CONTINUE
 WRITE(30,*) "endsolid GEOM"     
CLOSE(20)
1 CONTINUE

END PROGRAM


