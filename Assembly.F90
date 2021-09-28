PROGRAM Assembly
IMPLICIT NONE

INTEGER :: i,j
DOUBLE PRECISION :: X(40000) ,Y(40000),Z(40000)
DOUBLE PRECISION ::xx,yy,zz
DOUBLE PRECISION :: Dist(40000)

X(:) = 0.0
Y(:) = 0.0
Z(:) = 0.0

DO 2 i = 1,5000
xx = -6.375+12.75*RAND()
yy = -6.375+12.75*RAND()
zz = -6.375+12.75*RAND()
Dist(:) = 1000.0
DO 3 j = 1,i-1
   Dist(j) = sqrt((X(j)-xx)**2+(Y(j)-yy)**2+(Z(j)-zz)**2)
3 CONTINUE
IF(MINVAL(Dist) .gt. 2.15)THEN
X(i) = xx
Y(i) = yy
Z(i) = zz
END IF
2 CONTINUE
OPEN(100,FILE="Bed.dat",FORM="FORMATTED")
DO 200 i = 1,5000
if(X(i).ne. 0.0 .and. Y(i) .ne. 0.0 .and. Z(i) .ne. 0.0)THEN
WRITE(100,*) X(i)*1E-6,Y(i)*1E-6,Z(i)*1E-6
END IF
200 CONTINUE

WRITE(100,*) "################################################"

DO 21 i = 5001,40000
xx = -10+20*RAND()
yy = -10+20*RAND()
zz = -10+20*RAND()
Dist(:) = 1000.0
DO 31 j = 1,i-1
   Dist(j) = sqrt((X(j)-xx)**2+(Y(j)-yy)**2+(Z(j)-zz)**2)
31 CONTINUE
IF(MINVAL(Dist) .gt. 2.15)THEN
X(i) = xx
Y(i) = yy
Z(i) = zz
END IF
21 CONTINUE
!(100,FILE="Assembly.dat",FORM="FORMATTED")
DO 2001 i = 5001,40000
if(X(i).ne. 0.0 .and. Y(i) .ne. 0.0 .and. Z(i) .ne. 0.0)THEN
WRITE(100,*) X(i)*1E-6,Y(i)*1E-6,Z(i)*1E-6
END IF
2001 CONTINUE




END PROGRAM
