[Statedef -2]

;������������������������������������������������������������������������������������
;�펞�Ď�-2�X�e�[�g
;������������������������������������������������������������������������������������

;������������������������������������������������������������������������������������
;�␳�Z�b�g�E���Z�b�g
;������������������������������������������������������������������������������������

fvar(0) = �␳�����l
;�{��FVar(1) �� �`�F�[���␳
;�{��FVar(2) �� �R���{�J�n����
;�{��FVar(3) �� �󂯐g�s�\���ԕ␳
;�{��FVar(10)�� �Q�[�W�ʕ␳

;-------------------------------------------------[�A���q�b�g�␳]

[State -2, VarSet];�����l��100���i���Z�b�g�j
Type     = VarSet
Trigger1 = FVar(1) != 1.00
Trigger1 = !(P2MoveType = H && (P2StateNo != [150,159]))
fvar(1)  = 1.0
IgnoreHitPause = 1

[State -2, VarSet];�ŏ��l�͂P��
Type     = VarSet
Trigger1 = FVar(1) < 0.01
fvar(1)  = 0.01
IgnoreHitPause = 1

;-------------------------------------------------[�A���Z����]

[state -2, �R���{�J�n����] ;���胊�Z�b�g
type     = VarSet
trigger1 = Numenemy > 0
trigger1 = enemy,movetype != H
fvar(2)  = 0

;-------------------------------------------------[EF�L�����Z���␳]

[state -2, �R���{�J�n����] ;���胊�Z�b�g
type     = VarSet
trigger1 = Numenemy > 0
trigger1 = enemy,movetype != H
fvar(4)  = 1.0

;-------------------------------------------------[EF�A���J�i�␳]

[state -2]
type     = VarSet
trigger1 = var(15) = 1 ;EF��
fvar(5)  = 1.05

[state -2]
type     = VarSet
trigger1 = var(15) = 0 ;EF��
fvar(5)  = 1.0

;-------------------------------------------------[���A�s�\���ԕ␳]

[State -2, VarSet];�����l��100���i���Z�b�g�j
Type     = VarSet
Trigger1 = FVar(3) != 1.00
Trigger1 = !(P2MoveType = H && (P2StateNo != [150,159]))
fvar(3)  = 1.0
IgnoreHitPause = 1

[State -2, VarSet];�ŏ��l�͂P��
Type     = VarSet
Trigger1 = FVar(3) < 0.01
fvar(3)  = 0.01
IgnoreHitPause = 1

;-------------------------------------------------[�A���J�i�Q�[�W�ʕ␳]

[State -2, �Q�[�W�␳]
Type     = VarSet
Trigger1 = fvar(20) < 1000
fvar(23)  = 1.0

[State -2, �Q�[�W�␳]
Type     = VarSet
Trigger1 = fvar(20) = [1000,1999]
fvar(23)  = 1.1

[State -2, �Q�[�W�␳]
Type     = VarSet
Trigger1 = fvar(20) >= 2000
fvar(23)  = 1.2

;-------------------------------------------------[�␳����]

[State -2, �ϐ�]
Type     = VarSet
Trigger1 = 1
IgnoreHitPause = 1
fvar(0)  = fvar(1)*fvar(4)*fvar(5)


;������������������������������������������������������������������������������������
;�����l  [�����l�~��=30%,�ő卪���l35%]
;������������������������������������������������������������������������������������

[State -2, DefenceMulSet]
Type     = DefenceMulSet
Trigger1 = Life < LifeMax*0.30
Value    = 0.65+(0.35*Life/(LifeMax*0.30))
IgnoreHitPause = 1

[state -2];debug
type = null;varset
trigger1 = Life < LifeMax*0.30
fvar(30)= 0.65+(0.35*Life/(LifeMax*0.30))



;������������������������������������������������������������������������������������
; �n�C�W�����v����
;������������������������������������������������������������������������������������

[State -2, �ϐ�]  ;�����W�����v ���͎��Ԑݒ�
Type = VarSet
Trigger1 = Command = "�����W�����v"
V = 4
Value = 20

[State -2, �ϐ�]  ;�����W�����v ���͎��Ԍ���
Type = VarAdd
Trigger1 = Var(4) > 0
V = 4
Value = -1

[State -2, �ϐ�]
Type = VarSet
Trigger1 = Var(4) < 0
V = 4
Value = 0

;������������������������������������������������������������������������������������
; �󒆃_�b�V������
;������������������������������������������������������������������������������������

[state -2]
type     = VarSet
trigger1 = StateType != A
var(5)   = 1


;������������������������������������������������������������������������������������
;�W�����v�L�����Z������
;������������������������������������������������������������������������������������

[state -2];���Z�b�g
type = VarSet
trigger1 = StateType != A
var(8) = 0

[state -2];���Z�b�g
type = VarSet
trigger1 = StateType != A
var(9) = 0


;������������������������������������������������������������������������������������
; �J�E���^�[�q�b�g����
;������������������������������������������������������������������������������������

[state -2, �ϐ�] ;�J�E���^�[����
type       = VarSet
TriggerAll = NumEnemy >= 1
trigger1   = Enemynear,Movetype != A
var(7)     = 0

[state -2, �ϐ�] ;�J�E���^�[����
type       = VarSet
TriggerAll = NumEnemy >= 1
trigger1   = Enemynear,Movetype  = A
var(7)     = 1


;������������������������������������������������������������������������������������
; KO�{�C�X����
;������������������������������������������������������������������������������������

[State -2, �w���p�[]
type     = Helper
trigger1 = NumHelper(9970) = 0
trigger1 = LoseKO = 1
;trigger1 = !Alive
pos      = 0,0
stateno  = 9970
ID       = 9970

;================================================[�ϐ��Ǘ�]

[State -2] ;KO����
type       = varset
triggerall = Lose
trigger1   = roundstate = 4
var(50)    = 1

;---------------------------------------

[State -2];�ʏ�Z����
type     = VarSet
trigger1 = enemy,hitdefattr = SCA, NA, NP, NT, SA, SP, ST
trigger2 = enemy,stateno < 2000
trigger2 = enemy,stateno != [5000,5999]
var(51)  = 0

[State -2];�K�E�Z����
type = varset
trigger1 = enemy,hitdefattr = SCA, HA, HP, HT
trigger2 = enemy,stateno >= 2000
trigger2 = enemy,stateno != [5000,5999]
var(51)  = 1

;================================================[�E�ߊǗ�]

[State -2, �E�ߔ���p]
type       = Helper
triggerall = var(51) != 0
triggerall = NumHelper(9971) = 0
trigger1   = !alive
trigger1   = matchover || teammode = turns
helpertype = normal
name       = "Datui"
id         = 9971
postype    = p1
pos        = 0,0
stateno    = 9971
keyctrl    = 0
ownpal     = 1
ignorehitpause = 1

[State -2, �E�߂���]
type     = ChangeAnim
trigger1 = stateno = 5020
trigger1 = time >= 0
trigger1 = NumHelper(9971) = 1
trigger1 = anim != 35030
value    = 35030
ignorehitpause = 1


;������������������������������������������������������������������������������������
;�A���J�i�Q�[�W�p�w���p�[�Ăяo��
;������������������������������������������������������������������������������������

[state -2, Helper];�A���J�i�Q�[�W�p�w���p�[
Type      = Helper
Trigger1  = NumHelper(20000) = 0
OwnPal    = 1
PosType   = P1
Pos       = 0, 0
ID        = 20000
StateNo   = 20000
PauseMoveTime = 999999
SuperMoveTime = 999999
Name      = "gage"

;������������������������������������������������������������������������������������
; �A���J�i�Q�[�W�̊Ǘ�
;������������������������������������������������������������������������������������

;-------------------------------------------------[��͐ݒ�Q]

[State -2, VarAdd];��͎�����
Type = VarAdd
Trigger1 = fVar(22) = 0						;�񕜗}�����Ԃ��O
Trigger1 = fVar(20) < fvar(21)				;���݂̗�� �� ���݂̍ő���
IgnoreHitPause = 1
fV = 20
Value = 3 * Fvar(23)

[State -2, VarAdd];��͉񕜖������Ԍ���
Type = VarAdd
Trigger1 = fVar(22) > 0
IgnoreHitPause = 1
fV = 22
Value = -1

;-------------------------------------------------[��͐ݒ�]

[State -2, VarSet];��͍ő�
Type = VarSet
Trigger1 = fVar(20) > fvar(21)
IgnoreHitPause = 1
fV = 20
Value = fvar(21)

[State -2, VarSet];�ʏ펞:��͍Œ�l��0
Type = VarSet
Trigger1 = fVar(20) < 0
IgnoreHitPause = 1
fV = 20
Value = 0

[State -2, VarSet];��͍ő�l�ݒ�
Type = VarSet
Trigger1 = fVar(20) > 3000
IgnoreHitPause = 1
fV = 20
Value = 3000

[State -2, VarSet];�o�C�^���ő�
Type = VarSet
Trigger1 = fVar(21) < 0
IgnoreHitPause = 1
fV = 21
Value = 0

[State -2, VarSet];�o�C�^���ŏ�
Type = VarSet
Trigger1 = fVar(21) > 3000
IgnoreHitPause = 1
fV = 21
Value = 3000

;-------------------------------------------------[�Q�[�W�㏸]

[State -2, �_���[�W��]
type       = VarAdd
TriggerAll = Fvar(20) >= Fvar(21)
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(damage) != 0
fv         = 21
Value      = Floor(GetHitVar(damage) *0.8) * ifelse(var(15)=1, 1.1, 1)
ignorehitpause = 1



;������������������������������������������������������������������������������������
; �t�H�[�X�Q�[�W�̊Ǘ�
;������������������������������������������������������������������������������������

;-------------------------------------------------[�t�H�[�X�Q�[�W�ݒ�]

[State -2, VarSet];�ʏ펞:�Œ�l��0
Type = VarSet
Trigger1 = fVar(10) < 0
IgnoreHitPause = 1
fV = 10
Value = 0

[State -2, VarSet];�ʏ펞:�ő�l��10000
Type = VarSet
Trigger1 = fVar(10) > 10000
IgnoreHitPause = 1
fV = 10
Value = 10000

;-------------------------------------------------[�t�H�[�X�Q�[�W�ݒ�-2]

[State -2, �ʏ��];�ʏ펞�t�H�[�X�Q�[�W��
Type     = Varadd
TriggerAll = roundState = 2
Trigger1 = fVar(10) < 10000
Trigger1 = Var(15) != 1			;EF���łȂ�
Trigger1 = Var(16)  = 0			;�o�[�X�g��ł͂Ȃ�
fvar(10) = floor(10000/270)

[State -2, ��������];�o�[�X�g�g�p��t�H�[�X�Q�[�W��
Type     = Varadd
TriggerAll = roundState = 2
Trigger1 = fVar(10) < 10000
Trigger1 = Var(16) = 1			;�o�[�X�g��
fvar(10) = floor((10000/270)*0.15)

;-------------------------------------------------[�t�H�[�X�Q�[�W�ݒ�-3]

[State -2] ;EF������
Type     = Varadd
Trigger1 = fVar(10) > 0
Trigger1 = Var(15)  = 1			;EF��
fV       = 10
Value    = -floor(10000/300)*ifelse(Var(14)=1, 2, 1)


;-------------------------------------------------[�e��t���O���Z�b�g]

[State -2] ;�o�[�X�g�t���O������
Type     = VarSet
Trigger1 = !var(15)			;EF���łȂ�
Trigger1 = fvar(10) >= 10000
var(16)  = 0

[state -2] ;�G�N�X�e���h�t�H�[�X�I��
type     = Varset
trigger1 = fvar(10) <= 0
trigger1 = Movetype != A
var(15)  = 0

[state -2] ;�t�H�[�X�L�����Z������
type     = Varset
trigger1 = fvar(10) <= 0
var(14)  = 0

[State -2, �w�i�O���[�X�P�[��]
type      = null;BGPalFx
triggerAll= (StateNo!=2400)
trigger1  = var(15) > 0
mul       = 256,256,256
invertall = 1
color     = 0
time      = 3
ignorehitpause = 1



;������������������������������������������������������������������������������������
; �x�l�f�B�N�g�D�X�̊Ǘ�
;������������������������������������������������������������������������������������

[State -2, VarSet]
Type     = VarSet
Trigger1 = 1;NumprojID(11000) > 0 ;�j�􂵂Ă���r������
IgnoreHitPause = 1
var(20)  = numhelper(11000) + numhelper(11001) + numhelper(11002)+ numhelper(11050) + numhelper(11051) + numhelper(11052)

[State -2, VarSet]
Type     = null;VarSet
Trigger1 = NumprojID(11000) = 0 ;�j�􂵂Ă���r���Ȃ�
IgnoreHitPause = 1
var(20)  = 0


;������������������������������������������������������������������������������������
; �G�t�F�N�g����
;������������������������������������������������������������������������������������

[State -2, RemoveExplod] ;C
Type       = RemoveExplod
TriggerAll = NumExplod(10220) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 220
ID         = 10220

[State -2, RemoveExplod] ;4C
Type       = RemoveExplod
TriggerAll = NumExplod(10225) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 225)
ID         = 10225

[State -2, RemoveExplod] ;JC
Type       = RemoveExplod
TriggerAll = NumExplod(10620) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 620)
ID         = 10620

[State -2, RemoveExplod] ;2C
Type       = RemoveExplod
TriggerAll = NumExplod(10420) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 420)
ID         = 10420

[State -2, RemoveExplod] ;2E
Type       = RemoveExplod
TriggerAll = NumExplod(10310) > 0
Trigger1   = MoveType = H
trigger2   = (StateNo != 311) && (StateNo != 312)
ID         = 10310

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11100) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1100
ID         = 11100

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11101) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1101
ID         = 11101

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11102) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1102
ID         = 11102

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11150) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1150
ID         = 11150

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11151) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1151
ID         = 11151

[State -2, RemoveExplod] ;�N���h
Type       = RemoveExplod
TriggerAll = NumExplod(11152) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1152
ID         = 11152

[State -2, RemoveExplod] ;�O�����A
Type       = RemoveExplod
TriggerAll = NumExplod(11200) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1200
ID         = 11200

[State -2, RemoveExplod] ;�O�����A
Type       = RemoveExplod
TriggerAll = NumExplod(11201) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1201
ID         = 11201

[State -2, RemoveExplod] ;�O�����A
Type       = RemoveExplod
TriggerAll = NumExplod(11202) > 0
Trigger1   = MoveType = H
trigger2   = StateNo != 1202
ID         = 11202

[State -2, RemoveExplod] ;�L���G
Type       = RemoveExplod
TriggerAll = NumExplod(1310) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1300)&&(StateNo != 1301)&&(StateNo != 1302)
ID         = 1310

[State -2, RemoveExplod] ;�L���G
Type       = RemoveExplod
TriggerAll = NumExplod(11301) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1301)
ID         = 11301

[State -2, RemoveExplod] ;�L���G
Type       = RemoveExplod
TriggerAll = NumExplod(11302) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 1302)
ID         = 11302

[State -2, RemoveExplod] ;�G�N�X�e���h
Type       = RemoveExplod
TriggerAll = NumExplod(12900) > 0
Trigger1   = MoveType = H
trigger2   =(StateNo != 2900)&&(StateNo != 2910)
ID         = 12900


[State -2, �f�o�b�O�Ǘ�];�z�[�~���O
type = null;displayToClipboard
text = "Homing=%f\tVel X=%d\tArcana=%d\Input=%d\tForse=%d"
params = (fvar(15)), floor(fvar(16)), floor(fvar(20)), var(27) ,floor(fvar(10))
trigger1 = 1
ignorehitpause = 1


[State -2, �f�o�b�O�Ǘ�]
type = displayToClipboard
text = "Rate=%f\trecover=%f\tArcana=%d\ploj=%d\tBoost=%d"
params = (fvar(0)), fvar(3), floor(fvar(20)), var(20) ,floor(fvar(26))
trigger1 = 1
ignorehitpause = 1





[Statedef -3]

;������������������������������������������������������������������������������������
; �펞�Ď�-3 �X�e�[�g
;������������������������������������������������������������������������������������

;������������������������������������������������������������������������������������
;���ʉ� �Đ�
;������������������������������������������������������������������������������������


[State -2, Playsnd];�_�E���� �h�T�b�I
type = PlaySnd
Trigger1 = StateNo = 5110
trigger1 = Time = 1
value = 52, 1
IgnoreHitPause = 1
Persistent = 0

[State -2, Playsnd];�_�E���� �h�T�b�I
type = PlaySnd
Trigger1 = StateNo = 5100
trigger1 = Time = 1
value = 52, 3
IgnoreHitPause = 1
Persistent = 0

[State -2, Helper];�_�E���G�t�F�N�g
type     = Helper
Trigger1 = StateNo = 5100
trigger1 = Time = 1
StateNo  = 7200
PosType  = P1
Pos      = 0, 0
Ownpal   = 1
ID       = 7200

[State -2, playsnd];�󂯐g�T�E���h
type = PlaySnd
Trigger1 = (StateNo = 5201)&&(Time = 1)
trigger2 = (StateNo = 5210)&&(Time = 1)
value = S3,1
IgnoreHitPause = 1
Persistent = 0



;������������������������������������������������������������������������������������
; �{�C�X�Ǘ�
;������������������������������������������������������������������������������������

;-------------------------------------[�ʏ�Z]

[State -2, �U��];A�U��
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 200 || stateno = 400 || stateno = 600
trigger1 = random < 800
value = S300,0+(random%3)
channel = 5

[State -2, �U��];B�U��
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 210 || stateno = 410 || stateno = 610  || stateno = 215 || stateno = 615
trigger1 = random < 800
value = S300,3+(random%3)
channel = 5

[State -2, �U��];C�U��
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 220 || stateno = 420 || stateno = 620  || stateno = 225
trigger1 = random < 800
value = S300,6+(random%3)
channel = 5

[State -2, �U��];E�U��
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 301
value = S300,10
channel = 5

[State -2, �U��];E�U��(�ő�^��)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 302
value = S300,11
channel = 5

[State -2, �U��];E�U��
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 311
value = S300,12
channel = 5

[State -2, �U��];E�U��(�ő�^��)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 312
value = S300,13
channel = 5

[State -2, �U��];E�U��(�ő�^��)
type = PlaySnd
triggerall = Time = 1 && Alive
trigger1 = stateno = 320
value = S300,14
channel = 5

[State -2, �U��];�������s
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 800
value = S300,22
channel = 5

[State -2, �U��];���o�[�������s
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 820
value = S300,22
channel = 5

[State -2, �U��];�󒆓������s
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 840
value = S300,22
channel = 5

[State -2, �U��];��������(��)
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 805
value = S5000, 0
channel = 5

[State -2, �U��];����
type = PlaySnd
triggerall = Animelem=3 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 3
channel = 5

[State -2, �U��];����
type = PlaySnd
triggerall = Animelem=8 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 4
channel = 5

[State -2, �U��];����
type = PlaySnd
triggerall = Animelem=14 && Alive
trigger1 = stateno = 802
Trigger1 = Random < 600
value = S300, 21
channel = 5

[State -2, �U��];���o�[����
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 822
value = S300, 21
channel = 5

;-----------------------------------------------------

[State -2, �U��];�T���g�D�N�X
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1000 || stateno = 1050
value = S400,0
channel = 5

[State -2, �U��];�N���h
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1100 || stateno = 1101 || stateno = 1102
value = S400,2
channel = 5

[State -2, �U��];�N���h (��)
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1150 || stateno = 1151 || stateno = 1152
value = S300,15
channel = 5


[State -3] ;�O�����A(����)
type       = PlaySnd
triggerAll = Alive
trigger1   = (StateNo = 1201) && (Time=1)
trigger2   = (StateNo = 1202) && (Time=1)
value      = s400, 3
channel    = 5

[State -3] ;�O�����A(�U��)
type       = PlaySnd
triggerAll = Movetype != H
trigger1   = (StateNo = 1200) && (Animelem=7)
trigger2   = (StateNo = 1201) && (Animelem=10)
trigger3   = (StateNo = 1202) && (Animelem=10)
value      = s400, 4
channel    = 5

[State -2, �U��];�L���G
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1300 || stateno = 1301 || stateno = 1302
value = S400,5
channel = 5

[State -2, �U��];�x�l�f�B�N�g�D�X
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1400 || stateno = 1401 || stateno = 1450 || stateno = 1451
value = S400,1
channel = 5

[State -2, �U��];�R���j�I
type = PlaySnd
triggerall = Time=1 && Alive
trigger1 = stateno = 1600 || stateno = 1601 || stateno = 1602
value = S400,6
channel = 5


[State -2, �U��];�����P�I��
type = PlaySnd
triggerall = Animelem=7 && Alive
trigger1 = stateno = 2000
value = S410, 9
channel = 5

[State -2, �U��];�����P�I��(�ǉ�)
type = PlaySnd
triggerall = Animelem=4 && Alive
trigger1 = stateno = 2050
value = S410, 10
channel = 5

[State -2, �U��];�Z�L�����X
type = PlaySnd
triggerall = Animelem=9 && Alive
trigger1 = stateno = 2200
value = S410, 7
channel = 5

[State -2, �U��];�Z�L�����X(�ǉ�)
type = PlaySnd
triggerall = Animelem=5 && Alive
trigger1 = stateno = 2250
value = S410, 8
channel = 5

[State -3] ;�O���f�B�E�X
type       = PlaySnd
triggerAll = Animelem = 10
trigger1   = StateNo = 2100
value      = s410, 1
channel    = 5

[State -3] ;�O���f�B�E�X(Air)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   = StateNo = 2110
value      = s410, 4
channel    = 5

[State -3] ;�O���f�B�E�X(���b�N)
type       = PlaySnd
triggerAll = Time = 1
trigger1   =(StateNo = 2101)&&(PrevStateNo=2100)
value      = s410, 2
channel    = 5

[State -3] ;�O���f�B�E�X(���b�N)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   =(StateNo = 2101)&&(PrevStateNo=2100)
value      = s410, 3
channel    = 5

[State -3] ;�O���f�B�E�XAir(���b�N)
type       = PlaySnd
triggerAll = Time = 1
trigger1   =(StateNo = 2101)&&(PrevStateNo=2110)
value      = s410, 5
channel    = 5

[State -3] ;�O���f�B�E�XAir(���b�N)
type       = PlaySnd
triggerAll = Animelem = 8
trigger1   =(StateNo = 2101)&&(PrevStateNo=2110)
value      = s410, 6
channel    = 5

[State -3] ;�O���f�B�E�X(�ǉ�)
type       = PlaySnd
triggerAll = time = 55
trigger1   = StateNo = 2150
value      = s410, 4
channel    = 5


[State -3] ;���N�C�G��
type       = PlaySnd
triggerAll = time = 1 && Alive
trigger1   = StateNo = 2300
value      = s410, 11
channel    = 5

[State -3] ;���N�C�G��
type       = PlaySnd
triggerAll = Animelem = 8 && Alive
trigger1   = StateNo = 2300
value      = s410, 12

[State -3] ;���N�C�G��(EF)
type       = PlaySnd
triggerAll = Animelem = 2 && Alive
trigger1   = StateNo = 2400
value      = s410, 0

[State -3] ;���N�C�G��(EF)
type       = PlaySnd
triggerAll = Movehit = 5 && Alive
trigger1   = StateNo = 2400
value      = s410, 11
channel    = 5

[State -3] ;���N�C�G��(EF)
type       = PlaySnd
triggerAll = Time = 85 && Alive
trigger1   = StateNo = 2410
value      = s410, 13



[State -3] ;�G�N�X�e���h(�ʏ�)
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2900)
value      = s500, 22

[State -3] ;�G�N�X�e���h(�L�����Z��)
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2910)
value      = s500, 20

[State -3] ;�o�[�X�g
type       = PlaySnd
triggerAll = Time = 1
triggerAll = Movetype != H
trigger1   = (StateNo = 2800) || (StateNo = 2810)
value      = s500, 30


[State -3, ��_���[�W]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = 0
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,0+(random%3)
channel    = 5

[State -3, ���_���[�W]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = 2
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,10+(random%3)
channel    = 5

[State -3, ���_���[�W]
type       = PlaySnd
triggerAll = Alive
triggerAll = Movetype = H && stateno != [120,155]
trigger1   = GetHitVar(animtype) = [3,5]
trigger1   = GetHitVar(damage) != 0
trigger1   = Random < 600
value      = s5000,20+(random%3)
channel    = 5

[State -3, �n��󂯐g]
type       = PlaySnd
triggerAll = Time = 1 && Alive
trigger1   = stateno = 5201
value      = S5100, 0
channel    = 5

[State -2, �󒆎󂯐g]
type       = PlaySnd
triggerall = Time = 1 && Alive
trigger1   = stateno = 5210
value      = S5100, 0
channel    = 5

[State -2, ���E���h��]
type     = PlaySnd
trigger1 = (anim = 5140)&&(animelemtime(2)=0)
value    = s11, 10




;��������������������������������������������������������������������������������������������������������
; | ��s���͏��� |
;��������������������������������������������������������������������������������������������������������

;---------------------------------------------[���l���Z�b�g]

;[State -3, �ϐ�]  ;�Z�̎�ޔ��ʃ��Z�b�g
;Type      = VarSet
;Trigger1  = !Var(31)        ; ���͖���
;Trigger2  = Ctrl            ; ��R���{��
;Trigger3  = MoveType != A  ; ��R���{��
;var(30)   = 0

[State -3, �ϐ�]
type     = Varset
trigger1 = var(30) != 0
trigger1 = var(31) <= 0
var(30)  = 0
IgnoreHitPause = 1


;---------------------------------------------[��t���Ԍ���]

[State -3, �ϐ�]
type     = VarAdd
trigger1 = var(31) > 0
var(31)  = -1

[State -3, �ϐ�]
type     = Varset
trigger1 = var(31) < 0
var(31)  = 0

;==============================================[�Z����]

;----------------------------------------------[�x�l�e�B�N�g�D�X]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22A"
trigger1    = StateNo != 5120
var(30)     = 1400

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22B"
trigger1    = StateNo != 5120
var(30)     = 1401

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "22C"
trigger1    = StateNo != 5120
var(30)     = 1402

;----------------------------------------------[�T���N�g�D�X]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236A"
trigger1    = StateNo != 5120
var(30)     = 1000

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236B"
trigger1    = StateNo != 5120
var(30)     = 1001

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236C"
trigger1    = StateNo != 5120
var(30)     = 1002

;----------------------------------------------[�O�����A�E�R���j�I]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214A"
trigger1    = StateNo != 5120
var(30)     = 1200

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214B"
trigger1    = StateNo != 5120
var(30)     = 1201

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214C"
trigger1    = StateNo != 5120
var(30)     = 1202

;----------------------------------------------[�N���h]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623A"
trigger1    = StateNo != 5120
var(30)     = 1100

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623B"
trigger1    = StateNo != 5120
var(30)     = 1101

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623C"
trigger1    = StateNo != 5120
var(30)     = 1102

;----------------------------------------------[�L���G]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421A"
trigger1    = StateNo != 5120
var(30)     = 1300

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421B"
trigger1    = StateNo != 5120
var(30)     = 1301

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "421C"
trigger1    = StateNo != 5120
var(30)     = 1302

;----------------------------------------------[���K�E�Z]

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "236AB"
trigger1    = StateNo != 5120
var(30)     = 2000

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "623AB"
trigger1    = StateNo != 5120
var(30)     = 2100

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "214AB"
trigger1    = StateNo != 5120
var(30)     = 2200

[State -3, ��s����]
type = VarSet
TriggerAll  = !var(59)
trigger1    = command = "���N�C�G��"
trigger1    = StateNo != 5120
var(30)     = 2300

;---------------------------------------------[�R�}���h�P�\����]

[State -3, �ϐ�]
Type        = VarSet
TriggerAll  = !Var(59)
;TriggerAll  = !Ctrl
Trigger1    = command = "a" || command = "b" || command = "c"
var(31)     = 3

[State -3, �ϐ�]
Type        = VarSet
TriggerAll  = !Var(59)
;TriggerAll  = !Ctrl
Trigger1    = command = "236A" || command = "236B" || command = "236C"
Trigger2    = command = "214A" || command = "214B" || command = "214C"
Trigger3    = command = "623A" || command = "623B" || command = "623C"
Trigger3    = command = "421A" || command = "421B" || command = "421C"
Trigger4    = command = "22A"  || command = "22B"  || command = "22C" 
Trigger1    = command = "236AB" || command = "214AB" || command = "623AB" || command = "���N�C�G��"
var(31)     = 5



;������������������������������������������������������������������������������������
; ���萁����΂����� / �G�t�F�N�g�\��
;������������������������������������������������������������������������������������

[State -3]  ;������ь���
Type     = Helper
Trigger1 = NumHelper(8045) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8012
StateNo  = 8045
PosType  = P2
Pos      = -5, -45
Ownpal   = 1
ID       = 8045

[State -2, Playsnd];����_�E���� �h�T�b�I
type     = PlaySnd
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8052
value    = s52, 3
IgnoreHitPause = 1
Persistent = 0

;������������������������������������������������������������������������������������
; �@�������� / �G�t�F�N�g�\��
;������������������������������������������������������������������������������������

[State -3]  ;�n�ʂɌ���
Type     = Helper
Trigger1 = NumHelper(8047) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8062
StateNo  = 8047
PosType  = P2
Pos      = 0, 5
Ownpal   = 1
ID       = 8047

[State -3]  ;�n�ʂɌ���
Type     = Helper
Trigger1 = NumHelper(8047) = 0
Trigger1 = NumTarget > 0
Trigger1 = Target,Time = 1
Trigger1 = Target,StateNo = 8072
StateNo  = 8047
PosType  = P2
Pos      = 0, 5
Ownpal   = 1
ID       = 8047

;��������������������������������������������������������������������������������������������������������
;��������ɂƂ�[�ɂ񂮁@�ł����
;��������������������������������������������������������������������������������������������������������

[State -3, TimeStop]
type     = AssertSpecial
Trigger1 = P2name = "Training" || P4name = "Training" 
flag     = timerfreeze
ignorehitpause = 1

[State -3, �ϐ�]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(10)    = 20000

[State -3, �ϐ�]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(20)    = 3000

[State -3, �ϐ�]
Type        = VarSet
TriggerAll  = !Var(59)
Trigger1    = P2name = "Training" || P4name = "Training" 
Trigger1    = (StateNo = [0,1]) && time = 60
fvar(21)    = 3000
