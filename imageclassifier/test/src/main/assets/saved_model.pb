ьФ
з√
D
AddV2
x"T
y"T
z"T"
Ttype:
2	АР
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
l
BatchMatMulV2
x"T
y"T
output"T"
Ttype:
2		"
adj_xbool( "
adj_ybool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
Ы
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
?
Mul
x"T
y"T
z"T"
Ttype:
2	Р

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
8
Pow
x"T
y"T
z"T"
Ttype:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
-
Sqrt
x"T
y"T"
Ttype:

2
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
┴
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring Ии
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
М
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.9.32v2.9.2-107-ga5ed5f39b678┐Т
С
Adam/digit_cap/wij/vVarHandleOp*
_output_shapes
: *
dtype0* 
shape:А	
*%
shared_nameAdam/digit_cap/wij/v
К
(Adam/digit_cap/wij/v/Read/ReadVariableOpReadVariableOpAdam/digit_cap/wij/v*+
_output_shapes
:А	
*
dtype0
У
Adam/prim_cap/conv2d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/prim_cap/conv2d_1/bias/v
М
1Adam/prim_cap/conv2d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/prim_cap/conv2d_1/bias/v*
_output_shapes	
:А*
dtype0
д
Adam/prim_cap/conv2d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:		АА*0
shared_name!Adam/prim_cap/conv2d_1/kernel/v
Э
3Adam/prim_cap/conv2d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/prim_cap/conv2d_1/kernel/v*(
_output_shapes
:		АА*
dtype0
}
Adam/conv2d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*#
shared_nameAdam/conv2d/bias/v
v
&Adam/conv2d/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv2d/bias/v*
_output_shapes	
:А*
dtype0
Н
Adam/conv2d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:		А*%
shared_nameAdam/conv2d/kernel/v
Ж
(Adam/conv2d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv2d/kernel/v*'
_output_shapes
:		А*
dtype0
С
Adam/digit_cap/wij/mVarHandleOp*
_output_shapes
: *
dtype0* 
shape:А	
*%
shared_nameAdam/digit_cap/wij/m
К
(Adam/digit_cap/wij/m/Read/ReadVariableOpReadVariableOpAdam/digit_cap/wij/m*+
_output_shapes
:А	
*
dtype0
У
Adam/prim_cap/conv2d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*.
shared_nameAdam/prim_cap/conv2d_1/bias/m
М
1Adam/prim_cap/conv2d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/prim_cap/conv2d_1/bias/m*
_output_shapes	
:А*
dtype0
д
Adam/prim_cap/conv2d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:		АА*0
shared_name!Adam/prim_cap/conv2d_1/kernel/m
Э
3Adam/prim_cap/conv2d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/prim_cap/conv2d_1/kernel/m*(
_output_shapes
:		АА*
dtype0
}
Adam/conv2d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*#
shared_nameAdam/conv2d/bias/m
v
&Adam/conv2d/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv2d/bias/m*
_output_shapes	
:А*
dtype0
Н
Adam/conv2d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:		А*%
shared_nameAdam/conv2d/kernel/m
Ж
(Adam/conv2d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv2d/kernel/m*'
_output_shapes
:		А*
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
Г
digit_cap/wijVarHandleOp*
_output_shapes
: *
dtype0* 
shape:А	
*
shared_namedigit_cap/wij
|
!digit_cap/wij/Read/ReadVariableOpReadVariableOpdigit_cap/wij*+
_output_shapes
:А	
*
dtype0
Е
prim_cap/conv2d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*'
shared_nameprim_cap/conv2d_1/bias
~
*prim_cap/conv2d_1/bias/Read/ReadVariableOpReadVariableOpprim_cap/conv2d_1/bias*
_output_shapes	
:А*
dtype0
Ц
prim_cap/conv2d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:		АА*)
shared_nameprim_cap/conv2d_1/kernel
П
,prim_cap/conv2d_1/kernel/Read/ReadVariableOpReadVariableOpprim_cap/conv2d_1/kernel*(
_output_shapes
:		АА*
dtype0
o
conv2d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*
shared_nameconv2d/bias
h
conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias*
_output_shapes	
:А*
dtype0

conv2d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:		А*
shared_nameconv2d/kernel
x
!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel*'
_output_shapes
:		А*
dtype0

NoOpNoOp
▄-
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Ч-
valueН-BК- BГ-
Ї
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	conv1
	prim_cap

	digit_cap
	optimizer

signatures*
'
0
1
2
3
4*
'
0
1
2
3
4*
* 
░
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

trace_0
trace_1* 

trace_0
trace_1* 
* 
╚
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses

kernel
bias
 !_jit_compiled_convolution_op*
Ы
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses
	(conv2*
Щ
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses
wij*
Ю
/iter

0beta_1

1beta_2
	2decay
3learning_ratemambmcmdmevfvgvhvivj*

4serving_default* 
MG
VARIABLE_VALUEconv2d/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEconv2d/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUEprim_cap/conv2d_1/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
VP
VARIABLE_VALUEprim_cap/conv2d_1/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdigit_cap/wij&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
* 

0
	1

2*

50
61*
* 
* 
* 
* 
* 
* 

0
1*

0
1*
* 
У
7non_trainable_variables

8layers
9metrics
:layer_regularization_losses
;layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses*

<trace_0* 

=trace_0* 
* 

0
1*

0
1*
* 
У
>non_trainable_variables

?layers
@metrics
Alayer_regularization_losses
Blayer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses*

Ctrace_0* 

Dtrace_0* 
╚
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses

kernel
bias
 K_jit_compiled_convolution_op*

0*

0*
* 
У
Lnon_trainable_variables

Mlayers
Nmetrics
Olayer_regularization_losses
Player_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses*

Qtrace_0* 

Rtrace_0* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
8
S	variables
T	keras_api
	Utotal
	Vcount*
H
W	variables
X	keras_api
	Ytotal
	Zcount
[
_fn_kwargs*
* 
* 
* 
* 
* 
* 
* 
* 

(0*
* 
* 
* 
* 
* 

0
1*

0
1*
* 
У
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

U0
V1*

S	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

Y0
Z1*

W	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
pj
VARIABLE_VALUEAdam/conv2d/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEAdam/conv2d/bias/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/prim_cap/conv2d_1/kernel/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUEAdam/prim_cap/conv2d_1/bias/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/digit_cap/wij/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv2d/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEAdam/conv2d/bias/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/prim_cap/conv2d_1/kernel/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ys
VARIABLE_VALUEAdam/prim_cap/conv2d_1/bias/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/digit_cap/wij/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
К
serving_default_input_1Placeholder*/
_output_shapes
:         *
dtype0*$
shape:         
Ч
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1conv2d/kernelconv2d/biasprim_cap/conv2d_1/kernelprim_cap/conv2d_1/biasdigit_cap/wij*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *+
f&R$
"__inference_signature_wrapper_4412
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
╙	
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename!conv2d/kernel/Read/ReadVariableOpconv2d/bias/Read/ReadVariableOp,prim_cap/conv2d_1/kernel/Read/ReadVariableOp*prim_cap/conv2d_1/bias/Read/ReadVariableOp!digit_cap/wij/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp(Adam/conv2d/kernel/m/Read/ReadVariableOp&Adam/conv2d/bias/m/Read/ReadVariableOp3Adam/prim_cap/conv2d_1/kernel/m/Read/ReadVariableOp1Adam/prim_cap/conv2d_1/bias/m/Read/ReadVariableOp(Adam/digit_cap/wij/m/Read/ReadVariableOp(Adam/conv2d/kernel/v/Read/ReadVariableOp&Adam/conv2d/bias/v/Read/ReadVariableOp3Adam/prim_cap/conv2d_1/kernel/v/Read/ReadVariableOp1Adam/prim_cap/conv2d_1/bias/v/Read/ReadVariableOp(Adam/digit_cap/wij/v/Read/ReadVariableOpConst*%
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *&
f!R
__inference__traced_save_4818
ю
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv2d/kernelconv2d/biasprim_cap/conv2d_1/kernelprim_cap/conv2d_1/biasdigit_cap/wij	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcountAdam/conv2d/kernel/mAdam/conv2d/bias/mAdam/prim_cap/conv2d_1/kernel/mAdam/prim_cap/conv2d_1/bias/mAdam/digit_cap/wij/mAdam/conv2d/kernel/vAdam/conv2d/bias/vAdam/prim_cap/conv2d_1/kernel/vAdam/prim_cap/conv2d_1/bias/vAdam/digit_cap/wij/v*$
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *)
f$R"
 __inference__traced_restore_4900иб
Й7
Ф

__inference__traced_save_4818
file_prefix,
(savev2_conv2d_kernel_read_readvariableop*
&savev2_conv2d_bias_read_readvariableop7
3savev2_prim_cap_conv2d_1_kernel_read_readvariableop5
1savev2_prim_cap_conv2d_1_bias_read_readvariableop,
(savev2_digit_cap_wij_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop3
/savev2_adam_conv2d_kernel_m_read_readvariableop1
-savev2_adam_conv2d_bias_m_read_readvariableop>
:savev2_adam_prim_cap_conv2d_1_kernel_m_read_readvariableop<
8savev2_adam_prim_cap_conv2d_1_bias_m_read_readvariableop3
/savev2_adam_digit_cap_wij_m_read_readvariableop3
/savev2_adam_conv2d_kernel_v_read_readvariableop1
-savev2_adam_conv2d_bias_v_read_readvariableop>
:savev2_adam_prim_cap_conv2d_1_kernel_v_read_readvariableop<
8savev2_adam_prim_cap_conv2d_1_bias_v_read_readvariableop3
/savev2_adam_digit_cap_wij_v_read_readvariableop
savev2_const

identity_1ИвMergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/partБ
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ╖
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*р

value╓
B╙
B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЯ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B Т

SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0(savev2_conv2d_kernel_read_readvariableop&savev2_conv2d_bias_read_readvariableop3savev2_prim_cap_conv2d_1_kernel_read_readvariableop1savev2_prim_cap_conv2d_1_bias_read_readvariableop(savev2_digit_cap_wij_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop/savev2_adam_conv2d_kernel_m_read_readvariableop-savev2_adam_conv2d_bias_m_read_readvariableop:savev2_adam_prim_cap_conv2d_1_kernel_m_read_readvariableop8savev2_adam_prim_cap_conv2d_1_bias_m_read_readvariableop/savev2_adam_digit_cap_wij_m_read_readvariableop/savev2_adam_conv2d_kernel_v_read_readvariableop-savev2_adam_conv2d_bias_v_read_readvariableop:savev2_adam_prim_cap_conv2d_1_kernel_v_read_readvariableop8savev2_adam_prim_cap_conv2d_1_bias_v_read_readvariableop/savev2_adam_digit_cap_wij_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *'
dtypes
2	Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*П
_input_shapes¤
·: :		А:А:		АА:А:А	
: : : : : : : : : :		А:А:		АА:А:А	
:		А:А:		АА:А:А	
: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:-)
'
_output_shapes
:		А:!

_output_shapes	
:А:.*
(
_output_shapes
:		АА:!

_output_shapes	
:А:1-
+
_output_shapes
:А	
:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :-)
'
_output_shapes
:		А:!

_output_shapes	
:А:.*
(
_output_shapes
:		АА:!

_output_shapes	
:А:1-
+
_output_shapes
:А	
:-)
'
_output_shapes
:		А:!

_output_shapes	
:А:.*
(
_output_shapes
:		АА:!

_output_shapes	
:А:1-
+
_output_shapes
:А	
:

_output_shapes
: 
┐
Й
(__inference_digit_cap_layer_call_fn_4613

inputs&
unknown:А	

identityИвStatefulPartitionedCall╦
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_digit_cap_layer_call_and_return_conditional_losses_4309o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":         А	
: 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :         А	

 
_user_specified_nameinputs
ц
Ь
%__inference_conv2d_layer_call_fn_4568

inputs"
unknown:		А
	unknown_0:	А
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:         А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv2d_layer_call_and_return_conditional_losses_4169x
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*0
_output_shapes
:         А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
■
Р
.__inference_capsule_network_layer_call_fn_4427

inputs"
unknown:		А
	unknown_0:	А%
	unknown_1:		АА
	unknown_2:	А(
	unknown_3:А	

identityИвStatefulPartitionedCallЕ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *R
fMRK
I__inference_capsule_network_layer_call_and_return_conditional_losses_4315o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
Ф
в
B__inference_prim_cap_layer_call_and_return_conditional_losses_4193

inputsC
'conv2d_1_conv2d_readvariableop_resource:		АА7
(conv2d_1_biasadd_readvariableop_resource:	А
identityИвconv2d_1/BiasAdd/ReadVariableOpвconv2d_1/Conv2D/ReadVariableOpР
conv2d_1/Conv2D/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*(
_output_shapes
:		АА*
dtype0н
conv2d_1/Conv2DConv2Dinputs&conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
Е
conv2d_1/BiasAdd/ReadVariableOpReadVariableOp(conv2d_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Щ
conv2d_1/BiasAddBiasAddconv2d_1/Conv2D:output:0'conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         Аj
Reshape/shapeConst*
_output_shapes
:*
dtype0*)
value B"                 Г
ReshapeReshapeconv2d_1/BiasAdd:output:0Reshape/shape:output:0*
T0*3
_output_shapes!
:          k
transpose/permConst*
_output_shapes
:*
dtype0*)
value B"                
	transpose	TransposeReshape:output:0transpose/perm:output:0*
T0*3
_output_shapes!
:          l
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*)
value B"    А           |
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :         А	k
Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"      
         x
TileTileReshape_1:output:0Tile/multiples:output:0*
T0*4
_output_shapes"
 :         А	
i
IdentityIdentityTile:output:0^NoOp*
T0*4
_output_shapes"
 :         А	
Й
NoOpNoOp ^conv2d_1/BiasAdd/ReadVariableOp^conv2d_1/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :         А: : 2B
conv2d_1/BiasAdd/ReadVariableOpconv2d_1/BiasAdd/ReadVariableOp2@
conv2d_1/Conv2D/ReadVariableOpconv2d_1/Conv2D/ReadVariableOp:X T
0
_output_shapes
:         А
 
_user_specified_nameinputs
ї
Я
'__inference_prim_cap_layer_call_fn_4588

inputs#
unknown:		АА
	unknown_0:	А
identityИвStatefulPartitionedCallф
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :         А	
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_prim_cap_layer_call_and_return_conditional_losses_4193|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :         А	
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :         А: : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:         А
 
_user_specified_nameinputs
И
√
@__inference_conv2d_layer_call_and_return_conditional_losses_4579

inputs9
conv2d_readvariableop_resource:		А.
biasadd_readvariableop_resource:	А
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:		А*
dtype0Ы
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0~
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         АY
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:         Аj
IdentityIdentityRelu:activations:0^NoOp*
T0*0
_output_shapes
:         Аw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
├░
у
__inference__wrapped_model_4150
input_1P
5capsule_network_conv2d_conv2d_readvariableop_resource:		АE
6capsule_network_conv2d_biasadd_readvariableop_resource:	А\
@capsule_network_prim_cap_conv2d_1_conv2d_readvariableop_resource:		ААP
Acapsule_network_prim_cap_conv2d_1_biasadd_readvariableop_resource:	АU
6capsule_network_digit_cap_tile_readvariableop_resource:А	

identityИв-capsule_network/conv2d/BiasAdd/ReadVariableOpв,capsule_network/conv2d/Conv2D/ReadVariableOpв-capsule_network/digit_cap/Tile/ReadVariableOpв8capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOpв7capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOpл
,capsule_network/conv2d/Conv2D/ReadVariableOpReadVariableOp5capsule_network_conv2d_conv2d_readvariableop_resource*'
_output_shapes
:		А*
dtype0╩
capsule_network/conv2d/Conv2DConv2Dinput_14capsule_network/conv2d/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
б
-capsule_network/conv2d/BiasAdd/ReadVariableOpReadVariableOp6capsule_network_conv2d_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0├
capsule_network/conv2d/BiasAddBiasAdd&capsule_network/conv2d/Conv2D:output:05capsule_network/conv2d/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         АЗ
capsule_network/conv2d/ReluRelu'capsule_network/conv2d/BiasAdd:output:0*
T0*0
_output_shapes
:         А┬
7capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOpReadVariableOp@capsule_network_prim_cap_conv2d_1_conv2d_readvariableop_resource*(
_output_shapes
:		АА*
dtype0В
(capsule_network/prim_cap/conv2d_1/Conv2DConv2D)capsule_network/conv2d/Relu:activations:0?capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
╖
8capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOpReadVariableOpAcapsule_network_prim_cap_conv2d_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ф
)capsule_network/prim_cap/conv2d_1/BiasAddBiasAdd1capsule_network/prim_cap/conv2d_1/Conv2D:output:0@capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         АГ
&capsule_network/prim_cap/Reshape/shapeConst*
_output_shapes
:*
dtype0*)
value B"                 ╬
 capsule_network/prim_cap/ReshapeReshape2capsule_network/prim_cap/conv2d_1/BiasAdd:output:0/capsule_network/prim_cap/Reshape/shape:output:0*
T0*3
_output_shapes!
:          Д
'capsule_network/prim_cap/transpose/permConst*
_output_shapes
:*
dtype0*)
value B"                ╩
"capsule_network/prim_cap/transpose	Transpose)capsule_network/prim_cap/Reshape:output:00capsule_network/prim_cap/transpose/perm:output:0*
T0*3
_output_shapes!
:          Е
(capsule_network/prim_cap/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*)
value B"    А           ╟
"capsule_network/prim_cap/Reshape_1Reshape&capsule_network/prim_cap/transpose:y:01capsule_network/prim_cap/Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :         А	Д
'capsule_network/prim_cap/Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"      
         ├
capsule_network/prim_cap/TileTile+capsule_network/prim_cap/Reshape_1:output:00capsule_network/prim_cap/Tile/multiples:output:0*
T0*4
_output_shapes"
 :         А	
И
/capsule_network/digit_cap/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"   А     
   j
%capsule_network/digit_cap/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    ├
capsule_network/digit_cap/zerosFill8capsule_network/digit_cap/zeros/shape_as_tensor:output:0.capsule_network/digit_cap/zeros/Const:output:0*
T0*'
_output_shapes
:А	
▒
-capsule_network/digit_cap/Tile/ReadVariableOpReadVariableOp6capsule_network_digit_cap_tile_readvariableop_resource*+
_output_shapes
:А	
*
dtype0Е
(capsule_network/digit_cap/Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"               ╞
capsule_network/digit_cap/TileTile5capsule_network/digit_cap/Tile/ReadVariableOp:value:01capsule_network/digit_cap/Tile/multiples:output:0*
T0*+
_output_shapes
:А	
И
!capsule_network/digit_cap/SoftmaxSoftmax(capsule_network/digit_cap/zeros:output:0*
T0*'
_output_shapes
:А	
┴
 capsule_network/digit_cap/MatMulBatchMatMulV2'capsule_network/digit_cap/Tile:output:0&capsule_network/prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
й
!capsule_network/digit_cap/SqueezeSqueeze)capsule_network/digit_cap/MatMul:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
Б
(capsule_network/digit_cap/transpose/permConst*
_output_shapes
:*
dtype0*%
valueB"             ╩
#capsule_network/digit_cap/transpose	Transpose*capsule_network/digit_cap/Squeeze:output:01capsule_network/digit_cap/transpose/perm:output:0*
T0*0
_output_shapes
:         А	
╡
capsule_network/digit_cap/mulMul+capsule_network/digit_cap/Softmax:softmax:0'capsule_network/digit_cap/transpose:y:0*
T0*0
_output_shapes
:         А	
q
/capsule_network/digit_cap/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :╖
capsule_network/digit_cap/SumSum!capsule_network/digit_cap/mul:z:08capsule_network/digit_cap/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
|
'capsule_network/digit_cap/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   ╝
!capsule_network/digit_cap/ReshapeReshape&capsule_network/digit_cap/Sum:output:00capsule_network/digit_cap/Reshape/shape:output:0*
T0*+
_output_shapes
:         
╖
"capsule_network/digit_cap/norm/mulMul*capsule_network/digit_cap/Reshape:output:0*capsule_network/digit_cap/Reshape:output:0*
T0*+
_output_shapes
:         
~
4capsule_network/digit_cap/norm/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:╫
"capsule_network/digit_cap/norm/SumSum&capsule_network/digit_cap/norm/mul:z:0=capsule_network/digit_cap/norm/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(О
#capsule_network/digit_cap/norm/SqrtSqrt+capsule_network/digit_cap/norm/Sum:output:0*
T0*+
_output_shapes
:         
*capsule_network/digit_cap/Tile_1/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   ╝
 capsule_network/digit_cap/Tile_1Tile'capsule_network/digit_cap/norm/Sqrt:y:03capsule_network/digit_cap/Tile_1/multiples:output:0*
T0*+
_output_shapes
:         
│
capsule_network/digit_cap/mul_1Mul)capsule_network/digit_cap/Tile_1:output:0*capsule_network/digit_cap/Reshape:output:0*
T0*+
_output_shapes
:         
d
capsule_network/digit_cap/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @п
capsule_network/digit_cap/powPow)capsule_network/digit_cap/Tile_1:output:0(capsule_network/digit_cap/pow/y:output:0*
T0*+
_output_shapes
:         
d
capsule_network/digit_cap/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?й
capsule_network/digit_cap/addAddV2(capsule_network/digit_cap/add/x:output:0!capsule_network/digit_cap/pow:z:0*
T0*+
_output_shapes
:         
к
!capsule_network/digit_cap/truedivRealDiv#capsule_network/digit_cap/mul_1:z:0!capsule_network/digit_cap/add:z:0*
T0*+
_output_shapes
:         
В
)capsule_network/digit_cap/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   ├
#capsule_network/digit_cap/Reshape_1Reshape%capsule_network/digit_cap/truediv:z:02capsule_network/digit_cap/Reshape_1/shape:output:0*
T0*/
_output_shapes
:         
Г
*capsule_network/digit_cap/Tile_2/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        ╞
 capsule_network/digit_cap/Tile_2Tile,capsule_network/digit_cap/Reshape_1:output:03capsule_network/digit_cap/Tile_2/multiples:output:0*
T0*0
_output_shapes
:         А	
╡
capsule_network/digit_cap/mul_2Mul)capsule_network/digit_cap/Tile_2:output:0'capsule_network/digit_cap/transpose:y:0*
T0*0
_output_shapes
:         А	
▓
capsule_network/digit_cap/add_1AddV2(capsule_network/digit_cap/zeros:output:0#capsule_network/digit_cap/mul_2:z:0*
T0*0
_output_shapes
:         А	
п
$capsule_network/digit_cap/norm_1/mulMul%capsule_network/digit_cap/truediv:z:0%capsule_network/digit_cap/truediv:z:0*
T0*+
_output_shapes
:         
А
6capsule_network/digit_cap/norm_1/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:▌
$capsule_network/digit_cap/norm_1/SumSum(capsule_network/digit_cap/norm_1/mul:z:0?capsule_network/digit_cap/norm_1/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(Т
%capsule_network/digit_cap/norm_1/SqrtSqrt-capsule_network/digit_cap/norm_1/Sum:output:0*
T0*+
_output_shapes
:         
в
#capsule_network/digit_cap/Squeeze_1Squeeze)capsule_network/digit_cap/norm_1/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
О
#capsule_network/digit_cap/Softmax_1Softmax#capsule_network/digit_cap/add_1:z:0*
T0*0
_output_shapes
:         А	
├
"capsule_network/digit_cap/MatMul_1BatchMatMulV2'capsule_network/digit_cap/Tile:output:0&capsule_network/prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
н
#capsule_network/digit_cap/Squeeze_2Squeeze+capsule_network/digit_cap/MatMul_1:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
Г
*capsule_network/digit_cap/transpose_1/permConst*
_output_shapes
:*
dtype0*%
valueB"             ╨
%capsule_network/digit_cap/transpose_1	Transpose,capsule_network/digit_cap/Squeeze_2:output:03capsule_network/digit_cap/transpose_1/perm:output:0*
T0*0
_output_shapes
:         А	
╗
capsule_network/digit_cap/mul_3Mul-capsule_network/digit_cap/Softmax_1:softmax:0)capsule_network/digit_cap/transpose_1:y:0*
T0*0
_output_shapes
:         А	
s
1capsule_network/digit_cap/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :╜
capsule_network/digit_cap/Sum_1Sum#capsule_network/digit_cap/mul_3:z:0:capsule_network/digit_cap/Sum_1/reduction_indices:output:0*
T0*+
_output_shapes
:         
~
)capsule_network/digit_cap/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   ┬
#capsule_network/digit_cap/Reshape_2Reshape(capsule_network/digit_cap/Sum_1:output:02capsule_network/digit_cap/Reshape_2/shape:output:0*
T0*+
_output_shapes
:         
╜
$capsule_network/digit_cap/norm_2/mulMul,capsule_network/digit_cap/Reshape_2:output:0,capsule_network/digit_cap/Reshape_2:output:0*
T0*+
_output_shapes
:         
А
6capsule_network/digit_cap/norm_2/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:▌
$capsule_network/digit_cap/norm_2/SumSum(capsule_network/digit_cap/norm_2/mul:z:0?capsule_network/digit_cap/norm_2/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(Т
%capsule_network/digit_cap/norm_2/SqrtSqrt-capsule_network/digit_cap/norm_2/Sum:output:0*
T0*+
_output_shapes
:         
*capsule_network/digit_cap/Tile_3/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   ╛
 capsule_network/digit_cap/Tile_3Tile)capsule_network/digit_cap/norm_2/Sqrt:y:03capsule_network/digit_cap/Tile_3/multiples:output:0*
T0*+
_output_shapes
:         
╡
capsule_network/digit_cap/mul_4Mul)capsule_network/digit_cap/Tile_3:output:0,capsule_network/digit_cap/Reshape_2:output:0*
T0*+
_output_shapes
:         
f
!capsule_network/digit_cap/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @│
capsule_network/digit_cap/pow_1Pow)capsule_network/digit_cap/Tile_3:output:0*capsule_network/digit_cap/pow_1/y:output:0*
T0*+
_output_shapes
:         
f
!capsule_network/digit_cap/add_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?п
capsule_network/digit_cap/add_2AddV2*capsule_network/digit_cap/add_2/x:output:0#capsule_network/digit_cap/pow_1:z:0*
T0*+
_output_shapes
:         
о
#capsule_network/digit_cap/truediv_1RealDiv#capsule_network/digit_cap/mul_4:z:0#capsule_network/digit_cap/add_2:z:0*
T0*+
_output_shapes
:         
В
)capsule_network/digit_cap/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   ┼
#capsule_network/digit_cap/Reshape_3Reshape'capsule_network/digit_cap/truediv_1:z:02capsule_network/digit_cap/Reshape_3/shape:output:0*
T0*/
_output_shapes
:         
Г
*capsule_network/digit_cap/Tile_4/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        ╞
 capsule_network/digit_cap/Tile_4Tile,capsule_network/digit_cap/Reshape_3:output:03capsule_network/digit_cap/Tile_4/multiples:output:0*
T0*0
_output_shapes
:         А	
╖
capsule_network/digit_cap/mul_5Mul)capsule_network/digit_cap/Tile_4:output:0)capsule_network/digit_cap/transpose_1:y:0*
T0*0
_output_shapes
:         А	
н
capsule_network/digit_cap/add_3AddV2#capsule_network/digit_cap/add_1:z:0#capsule_network/digit_cap/mul_5:z:0*
T0*0
_output_shapes
:         А	
│
$capsule_network/digit_cap/norm_3/mulMul'capsule_network/digit_cap/truediv_1:z:0'capsule_network/digit_cap/truediv_1:z:0*
T0*+
_output_shapes
:         
А
6capsule_network/digit_cap/norm_3/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:▌
$capsule_network/digit_cap/norm_3/SumSum(capsule_network/digit_cap/norm_3/mul:z:0?capsule_network/digit_cap/norm_3/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(Т
%capsule_network/digit_cap/norm_3/SqrtSqrt-capsule_network/digit_cap/norm_3/Sum:output:0*
T0*+
_output_shapes
:         
в
#capsule_network/digit_cap/Squeeze_3Squeeze)capsule_network/digit_cap/norm_3/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
О
#capsule_network/digit_cap/Softmax_2Softmax#capsule_network/digit_cap/add_3:z:0*
T0*0
_output_shapes
:         А	
├
"capsule_network/digit_cap/MatMul_2BatchMatMulV2'capsule_network/digit_cap/Tile:output:0&capsule_network/prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
н
#capsule_network/digit_cap/Squeeze_4Squeeze+capsule_network/digit_cap/MatMul_2:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
Г
*capsule_network/digit_cap/transpose_2/permConst*
_output_shapes
:*
dtype0*%
valueB"             ╨
%capsule_network/digit_cap/transpose_2	Transpose,capsule_network/digit_cap/Squeeze_4:output:03capsule_network/digit_cap/transpose_2/perm:output:0*
T0*0
_output_shapes
:         А	
╗
capsule_network/digit_cap/mul_6Mul-capsule_network/digit_cap/Softmax_2:softmax:0)capsule_network/digit_cap/transpose_2:y:0*
T0*0
_output_shapes
:         А	
s
1capsule_network/digit_cap/Sum_2/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :╜
capsule_network/digit_cap/Sum_2Sum#capsule_network/digit_cap/mul_6:z:0:capsule_network/digit_cap/Sum_2/reduction_indices:output:0*
T0*+
_output_shapes
:         
~
)capsule_network/digit_cap/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   ┬
#capsule_network/digit_cap/Reshape_4Reshape(capsule_network/digit_cap/Sum_2:output:02capsule_network/digit_cap/Reshape_4/shape:output:0*
T0*+
_output_shapes
:         
╜
$capsule_network/digit_cap/norm_4/mulMul,capsule_network/digit_cap/Reshape_4:output:0,capsule_network/digit_cap/Reshape_4:output:0*
T0*+
_output_shapes
:         
А
6capsule_network/digit_cap/norm_4/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:▌
$capsule_network/digit_cap/norm_4/SumSum(capsule_network/digit_cap/norm_4/mul:z:0?capsule_network/digit_cap/norm_4/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(Т
%capsule_network/digit_cap/norm_4/SqrtSqrt-capsule_network/digit_cap/norm_4/Sum:output:0*
T0*+
_output_shapes
:         
*capsule_network/digit_cap/Tile_5/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   ╛
 capsule_network/digit_cap/Tile_5Tile)capsule_network/digit_cap/norm_4/Sqrt:y:03capsule_network/digit_cap/Tile_5/multiples:output:0*
T0*+
_output_shapes
:         
╡
capsule_network/digit_cap/mul_7Mul)capsule_network/digit_cap/Tile_5:output:0,capsule_network/digit_cap/Reshape_4:output:0*
T0*+
_output_shapes
:         
f
!capsule_network/digit_cap/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @│
capsule_network/digit_cap/pow_2Pow)capsule_network/digit_cap/Tile_5:output:0*capsule_network/digit_cap/pow_2/y:output:0*
T0*+
_output_shapes
:         
f
!capsule_network/digit_cap/add_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?п
capsule_network/digit_cap/add_4AddV2*capsule_network/digit_cap/add_4/x:output:0#capsule_network/digit_cap/pow_2:z:0*
T0*+
_output_shapes
:         
о
#capsule_network/digit_cap/truediv_2RealDiv#capsule_network/digit_cap/mul_7:z:0#capsule_network/digit_cap/add_4:z:0*
T0*+
_output_shapes
:         
В
)capsule_network/digit_cap/Reshape_5/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   ┼
#capsule_network/digit_cap/Reshape_5Reshape'capsule_network/digit_cap/truediv_2:z:02capsule_network/digit_cap/Reshape_5/shape:output:0*
T0*/
_output_shapes
:         
Г
*capsule_network/digit_cap/Tile_6/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        ╞
 capsule_network/digit_cap/Tile_6Tile,capsule_network/digit_cap/Reshape_5:output:03capsule_network/digit_cap/Tile_6/multiples:output:0*
T0*0
_output_shapes
:         А	
╖
capsule_network/digit_cap/mul_8Mul)capsule_network/digit_cap/Tile_6:output:0)capsule_network/digit_cap/transpose_2:y:0*
T0*0
_output_shapes
:         А	
н
capsule_network/digit_cap/add_5AddV2#capsule_network/digit_cap/add_3:z:0#capsule_network/digit_cap/mul_8:z:0*
T0*0
_output_shapes
:         А	
│
$capsule_network/digit_cap/norm_5/mulMul'capsule_network/digit_cap/truediv_2:z:0'capsule_network/digit_cap/truediv_2:z:0*
T0*+
_output_shapes
:         
А
6capsule_network/digit_cap/norm_5/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:▌
$capsule_network/digit_cap/norm_5/SumSum(capsule_network/digit_cap/norm_5/mul:z:0?capsule_network/digit_cap/norm_5/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(Т
%capsule_network/digit_cap/norm_5/SqrtSqrt-capsule_network/digit_cap/norm_5/Sum:output:0*
T0*+
_output_shapes
:         
в
#capsule_network/digit_cap/Squeeze_5Squeeze)capsule_network/digit_cap/norm_5/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
В
capsule_network/SoftmaxSoftmax,capsule_network/digit_cap/Squeeze_5:output:0*
T0*'
_output_shapes
:         
p
IdentityIdentity!capsule_network/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:         
╩
NoOpNoOp.^capsule_network/conv2d/BiasAdd/ReadVariableOp-^capsule_network/conv2d/Conv2D/ReadVariableOp.^capsule_network/digit_cap/Tile/ReadVariableOp9^capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOp8^capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 2^
-capsule_network/conv2d/BiasAdd/ReadVariableOp-capsule_network/conv2d/BiasAdd/ReadVariableOp2\
,capsule_network/conv2d/Conv2D/ReadVariableOp,capsule_network/conv2d/Conv2D/ReadVariableOp2^
-capsule_network/digit_cap/Tile/ReadVariableOp-capsule_network/digit_cap/Tile/ReadVariableOp2t
8capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOp8capsule_network/prim_cap/conv2d_1/BiasAdd/ReadVariableOp2r
7capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOp7capsule_network/prim_cap/conv2d_1/Conv2D/ReadVariableOp:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
╦
М
I__inference_capsule_network_layer_call_and_return_conditional_losses_4315

inputs&
conv2d_4170:		А
conv2d_4172:	А)
prim_cap_4194:		АА
prim_cap_4196:	А-
digit_cap_4310:А	

identityИвconv2d/StatefulPartitionedCallв!digit_cap/StatefulPartitionedCallв prim_cap/StatefulPartitionedCallы
conv2d/StatefulPartitionedCallStatefulPartitionedCallinputsconv2d_4170conv2d_4172*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:         А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv2d_layer_call_and_return_conditional_losses_4169Ш
 prim_cap/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0prim_cap_4194prim_cap_4196*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :         А	
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_prim_cap_layer_call_and_return_conditional_losses_4193 
!digit_cap/StatefulPartitionedCallStatefulPartitionedCall)prim_cap/StatefulPartitionedCall:output:0digit_cap_4310*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_digit_cap_layer_call_and_return_conditional_losses_4309p
SoftmaxSoftmax*digit_cap/StatefulPartitionedCall:output:0*
T0*'
_output_shapes
:         
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:         
о
NoOpNoOp^conv2d/StatefulPartitionedCall"^digit_cap/StatefulPartitionedCall!^prim_cap/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2F
!digit_cap/StatefulPartitionedCall!digit_cap/StatefulPartitionedCall2D
 prim_cap/StatefulPartitionedCall prim_cap/StatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
╬
Н
I__inference_capsule_network_layer_call_and_return_conditional_losses_4389
input_1&
conv2d_4374:		А
conv2d_4376:	А)
prim_cap_4379:		АА
prim_cap_4381:	А-
digit_cap_4384:А	

identityИвconv2d/StatefulPartitionedCallв!digit_cap/StatefulPartitionedCallв prim_cap/StatefulPartitionedCallь
conv2d/StatefulPartitionedCallStatefulPartitionedCallinput_1conv2d_4374conv2d_4376*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:         А*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *I
fDRB
@__inference_conv2d_layer_call_and_return_conditional_losses_4169Ш
 prim_cap/StatefulPartitionedCallStatefulPartitionedCall'conv2d/StatefulPartitionedCall:output:0prim_cap_4379prim_cap_4381*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :         А	
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_prim_cap_layer_call_and_return_conditional_losses_4193 
!digit_cap/StatefulPartitionedCallStatefulPartitionedCall)prim_cap/StatefulPartitionedCall:output:0digit_cap_4384*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_digit_cap_layer_call_and_return_conditional_losses_4309p
SoftmaxSoftmax*digit_cap/StatefulPartitionedCall:output:0*
T0*'
_output_shapes
:         
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:         
о
NoOpNoOp^conv2d/StatefulPartitionedCall"^digit_cap/StatefulPartitionedCall!^prim_cap/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 2@
conv2d/StatefulPartitionedCallconv2d/StatefulPartitionedCall2F
!digit_cap/StatefulPartitionedCall!digit_cap/StatefulPartitionedCall2D
 prim_cap/StatefulPartitionedCall prim_cap/StatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
И
√
@__inference_conv2d_layer_call_and_return_conditional_losses_4169

inputs9
conv2d_readvariableop_resource:		А.
biasadd_readvariableop_resource:	А
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp}
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:		А*
dtype0Ы
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0~
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         АY
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:         Аj
IdentityIdentityRelu:activations:0^NoOp*
T0*0
_output_shapes
:         Аw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
Б	
С
.__inference_capsule_network_layer_call_fn_4328
input_1"
unknown:		А
	unknown_0:	А%
	unknown_1:		АА
	unknown_2:	А(
	unknown_3:А	

identityИвStatefulPartitionedCallЖ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *R
fMRK
I__inference_capsule_network_layer_call_and_return_conditional_losses_4315o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
└`
Ч
 __inference__traced_restore_4900
file_prefix9
assignvariableop_conv2d_kernel:		А-
assignvariableop_1_conv2d_bias:	АG
+assignvariableop_2_prim_cap_conv2d_1_kernel:		АА8
)assignvariableop_3_prim_cap_conv2d_1_bias:	А?
 assignvariableop_4_digit_cap_wij:А	
&
assignvariableop_5_adam_iter:	 (
assignvariableop_6_adam_beta_1: (
assignvariableop_7_adam_beta_2: '
assignvariableop_8_adam_decay: /
%assignvariableop_9_adam_learning_rate: %
assignvariableop_10_total_1: %
assignvariableop_11_count_1: #
assignvariableop_12_total: #
assignvariableop_13_count: C
(assignvariableop_14_adam_conv2d_kernel_m:		А5
&assignvariableop_15_adam_conv2d_bias_m:	АO
3assignvariableop_16_adam_prim_cap_conv2d_1_kernel_m:		АА@
1assignvariableop_17_adam_prim_cap_conv2d_1_bias_m:	АG
(assignvariableop_18_adam_digit_cap_wij_m:А	
C
(assignvariableop_19_adam_conv2d_kernel_v:		А5
&assignvariableop_20_adam_conv2d_bias_v:	АO
3assignvariableop_21_adam_prim_cap_conv2d_1_kernel_v:		АА@
1assignvariableop_22_adam_prim_cap_conv2d_1_bias_v:	АG
(assignvariableop_23_adam_digit_cap_wij_v:А	

identity_25ИвAssignVariableOpвAssignVariableOp_1вAssignVariableOp_10вAssignVariableOp_11вAssignVariableOp_12вAssignVariableOp_13вAssignVariableOp_14вAssignVariableOp_15вAssignVariableOp_16вAssignVariableOp_17вAssignVariableOp_18вAssignVariableOp_19вAssignVariableOp_2вAssignVariableOp_20вAssignVariableOp_21вAssignVariableOp_22вAssignVariableOp_23вAssignVariableOp_3вAssignVariableOp_4вAssignVariableOp_5вAssignVariableOp_6вAssignVariableOp_7вAssignVariableOp_8вAssignVariableOp_9║
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*р

value╓
B╙
B&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHв
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B Ы
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*x
_output_shapesf
d:::::::::::::::::::::::::*'
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:Й
AssignVariableOpAssignVariableOpassignvariableop_conv2d_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_1AssignVariableOpassignvariableop_1_conv2d_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_2AssignVariableOp+assignvariableop_2_prim_cap_conv2d_1_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_3AssignVariableOp)assignvariableop_3_prim_cap_conv2d_1_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_4AssignVariableOp assignvariableop_4_digit_cap_wijIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0	*
_output_shapes
:Л
AssignVariableOp_5AssignVariableOpassignvariableop_5_adam_iterIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_beta_1Identity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_7AssignVariableOpassignvariableop_7_adam_beta_2Identity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_decayIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_9AssignVariableOp%assignvariableop_9_adam_learning_rateIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_10AssignVariableOpassignvariableop_10_total_1Identity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_11AssignVariableOpassignvariableop_11_count_1Identity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_12AssignVariableOpassignvariableop_12_totalIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_13AssignVariableOpassignvariableop_13_countIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_14AssignVariableOp(assignvariableop_14_adam_conv2d_kernel_mIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_15AssignVariableOp&assignvariableop_15_adam_conv2d_bias_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:д
AssignVariableOp_16AssignVariableOp3assignvariableop_16_adam_prim_cap_conv2d_1_kernel_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:в
AssignVariableOp_17AssignVariableOp1assignvariableop_17_adam_prim_cap_conv2d_1_bias_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_18AssignVariableOp(assignvariableop_18_adam_digit_cap_wij_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_19AssignVariableOp(assignvariableop_19_adam_conv2d_kernel_vIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_20AssignVariableOp&assignvariableop_20_adam_conv2d_bias_vIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:д
AssignVariableOp_21AssignVariableOp3assignvariableop_21_adam_prim_cap_conv2d_1_kernel_vIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:в
AssignVariableOp_22AssignVariableOp1assignvariableop_22_adam_prim_cap_conv2d_1_bias_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Щ
AssignVariableOp_23AssignVariableOp(assignvariableop_23_adam_digit_cap_wij_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ▀
Identity_24Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_25IdentityIdentity_24:output:0^NoOp_1*
T0*
_output_shapes
: ╠
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_25Identity_25:output:0*E
_input_shapes4
2: : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
Ф
в
B__inference_prim_cap_layer_call_and_return_conditional_losses_4606

inputsC
'conv2d_1_conv2d_readvariableop_resource:		АА7
(conv2d_1_biasadd_readvariableop_resource:	А
identityИвconv2d_1/BiasAdd/ReadVariableOpвconv2d_1/Conv2D/ReadVariableOpР
conv2d_1/Conv2D/ReadVariableOpReadVariableOp'conv2d_1_conv2d_readvariableop_resource*(
_output_shapes
:		АА*
dtype0н
conv2d_1/Conv2DConv2Dinputs&conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
Е
conv2d_1/BiasAdd/ReadVariableOpReadVariableOp(conv2d_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Щ
conv2d_1/BiasAddBiasAddconv2d_1/Conv2D:output:0'conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         Аj
Reshape/shapeConst*
_output_shapes
:*
dtype0*)
value B"                 Г
ReshapeReshapeconv2d_1/BiasAdd:output:0Reshape/shape:output:0*
T0*3
_output_shapes!
:          k
transpose/permConst*
_output_shapes
:*
dtype0*)
value B"                
	transpose	TransposeReshape:output:0transpose/perm:output:0*
T0*3
_output_shapes!
:          l
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*)
value B"    А           |
	Reshape_1Reshapetranspose:y:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :         А	k
Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"      
         x
TileTileReshape_1:output:0Tile/multiples:output:0*
T0*4
_output_shapes"
 :         А	
i
IdentityIdentityTile:output:0^NoOp*
T0*4
_output_shapes"
 :         А	
Й
NoOpNoOp ^conv2d_1/BiasAdd/ReadVariableOp^conv2d_1/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*3
_input_shapes"
 :         А: : 2B
conv2d_1/BiasAdd/ReadVariableOpconv2d_1/BiasAdd/ReadVariableOp2@
conv2d_1/Conv2D/ReadVariableOpconv2d_1/Conv2D/ReadVariableOp:X T
0
_output_shapes
:         А
 
_user_specified_nameinputs
З]
╡
C__inference_digit_cap_layer_call_and_return_conditional_losses_4723

inputs;
tile_readvariableop_resource:А	

identityИвTile/ReadVariableOpn
zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"   А     
   P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    u
zerosFillzeros/shape_as_tensor:output:0zeros/Const:output:0*
T0*'
_output_shapes
:А	
}
Tile/ReadVariableOpReadVariableOptile_readvariableop_resource*+
_output_shapes
:А	
*
dtype0k
Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"               x
TileTileTile/ReadVariableOp:value:0Tile/multiples:output:0*
T0*+
_output_shapes
:А	
T
SoftmaxSoftmaxzeros:output:0*
T0*'
_output_shapes
:А	
m
MatMulBatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
u
SqueezeSqueezeMatMul:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
g
transpose/permConst*
_output_shapes
:*
dtype0*%
valueB"             |
	transpose	TransposeSqueeze:output:0transpose/perm:output:0*
T0*0
_output_shapes
:         А	
g
mulMulSoftmax:softmax:0transpose:y:0*
T0*0
_output_shapes
:         А	
W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :i
SumSummul:z:0Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
b
Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   n
ReshapeReshapeSum:output:0Reshape/shape:output:0*
T0*+
_output_shapes
:         
i
norm/mulMulReshape:output:0Reshape:output:0*
T0*+
_output_shapes
:         
d
norm/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Й
norm/SumSumnorm/mul:z:0#norm/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(Z
	norm/SqrtSqrtnorm/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_1/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   n
Tile_1Tilenorm/Sqrt:y:0Tile_1/multiples:output:0*
T0*+
_output_shapes
:         
e
mul_1MulTile_1:output:0Reshape:output:0*
T0*+
_output_shapes
:         
J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
powPowTile_1:output:0pow/y:output:0*
T0*+
_output_shapes
:         
J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
addAddV2add/x:output:0pow:z:0*
T0*+
_output_shapes
:         
\
truedivRealDiv	mul_1:z:0add:z:0*
T0*+
_output_shapes
:         
h
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   u
	Reshape_1Reshapetruediv:z:0Reshape_1/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_2/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_2TileReshape_1:output:0Tile_2/multiples:output:0*
T0*0
_output_shapes
:         А	
g
mul_2MulTile_2:output:0transpose:y:0*
T0*0
_output_shapes
:         А	
d
add_1AddV2zeros:output:0	mul_2:z:0*
T0*0
_output_shapes
:         А	
a

norm_1/mulMultruediv:z:0truediv:z:0*
T0*+
_output_shapes
:         
f
norm_1/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_1/SumSumnorm_1/mul:z:0%norm_1/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_1/SqrtSqrtnorm_1/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_1Squeezenorm_1/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
Z
	Softmax_1Softmax	add_1:z:0*
T0*0
_output_shapes
:         А	
o
MatMul_1BatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
y
	Squeeze_2SqueezeMatMul_1:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
i
transpose_1/permConst*
_output_shapes
:*
dtype0*%
valueB"             В
transpose_1	TransposeSqueeze_2:output:0transpose_1/perm:output:0*
T0*0
_output_shapes
:         А	
m
mul_3MulSoftmax_1:softmax:0transpose_1:y:0*
T0*0
_output_shapes
:         А	
Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :o
Sum_1Sum	mul_3:z:0 Sum_1/reduction_indices:output:0*
T0*+
_output_shapes
:         
d
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   t
	Reshape_2ReshapeSum_1:output:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:         
o

norm_2/mulMulReshape_2:output:0Reshape_2:output:0*
T0*+
_output_shapes
:         
f
norm_2/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_2/SumSumnorm_2/mul:z:0%norm_2/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(^
norm_2/SqrtSqrtnorm_2/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_3/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   p
Tile_3Tilenorm_2/Sqrt:y:0Tile_3/multiples:output:0*
T0*+
_output_shapes
:         
g
mul_4MulTile_3:output:0Reshape_2:output:0*
T0*+
_output_shapes
:         
L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
pow_1PowTile_3:output:0pow_1/y:output:0*
T0*+
_output_shapes
:         
L
add_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
add_2AddV2add_2/x:output:0	pow_1:z:0*
T0*+
_output_shapes
:         
`
	truediv_1RealDiv	mul_4:z:0	add_2:z:0*
T0*+
_output_shapes
:         
h
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   w
	Reshape_3Reshapetruediv_1:z:0Reshape_3/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_4/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_4TileReshape_3:output:0Tile_4/multiples:output:0*
T0*0
_output_shapes
:         А	
i
mul_5MulTile_4:output:0transpose_1:y:0*
T0*0
_output_shapes
:         А	
_
add_3AddV2	add_1:z:0	mul_5:z:0*
T0*0
_output_shapes
:         А	
e

norm_3/mulMultruediv_1:z:0truediv_1:z:0*
T0*+
_output_shapes
:         
f
norm_3/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_3/SumSumnorm_3/mul:z:0%norm_3/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_3/SqrtSqrtnorm_3/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_3Squeezenorm_3/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
Z
	Softmax_2Softmax	add_3:z:0*
T0*0
_output_shapes
:         А	
o
MatMul_2BatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
y
	Squeeze_4SqueezeMatMul_2:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
i
transpose_2/permConst*
_output_shapes
:*
dtype0*%
valueB"             В
transpose_2	TransposeSqueeze_4:output:0transpose_2/perm:output:0*
T0*0
_output_shapes
:         А	
m
mul_6MulSoftmax_2:softmax:0transpose_2:y:0*
T0*0
_output_shapes
:         А	
Y
Sum_2/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :o
Sum_2Sum	mul_6:z:0 Sum_2/reduction_indices:output:0*
T0*+
_output_shapes
:         
d
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   t
	Reshape_4ReshapeSum_2:output:0Reshape_4/shape:output:0*
T0*+
_output_shapes
:         
o

norm_4/mulMulReshape_4:output:0Reshape_4:output:0*
T0*+
_output_shapes
:         
f
norm_4/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_4/SumSumnorm_4/mul:z:0%norm_4/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(^
norm_4/SqrtSqrtnorm_4/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_5/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   p
Tile_5Tilenorm_4/Sqrt:y:0Tile_5/multiples:output:0*
T0*+
_output_shapes
:         
g
mul_7MulTile_5:output:0Reshape_4:output:0*
T0*+
_output_shapes
:         
L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
pow_2PowTile_5:output:0pow_2/y:output:0*
T0*+
_output_shapes
:         
L
add_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
add_4AddV2add_4/x:output:0	pow_2:z:0*
T0*+
_output_shapes
:         
`
	truediv_2RealDiv	mul_7:z:0	add_4:z:0*
T0*+
_output_shapes
:         
h
Reshape_5/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   w
	Reshape_5Reshapetruediv_2:z:0Reshape_5/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_6/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_6TileReshape_5:output:0Tile_6/multiples:output:0*
T0*0
_output_shapes
:         А	
i
mul_8MulTile_6:output:0transpose_2:y:0*
T0*0
_output_shapes
:         А	
_
add_5AddV2	add_3:z:0	mul_8:z:0*
T0*0
_output_shapes
:         А	
e

norm_5/mulMultruediv_2:z:0truediv_2:z:0*
T0*+
_output_shapes
:         
f
norm_5/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_5/SumSumnorm_5/mul:z:0%norm_5/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_5/SqrtSqrtnorm_5/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_5Squeezenorm_5/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
a
IdentityIdentitySqueeze_5:output:0^NoOp*
T0*'
_output_shapes
:         
\
NoOpNoOp^Tile/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":         А	
: 2*
Tile/ReadVariableOpTile/ReadVariableOp:\ X
4
_output_shapes"
 :         А	

 
_user_specified_nameinputs
бЛ
ь
I__inference_capsule_network_layer_call_and_return_conditional_losses_4559

inputs@
%conv2d_conv2d_readvariableop_resource:		А5
&conv2d_biasadd_readvariableop_resource:	АL
0prim_cap_conv2d_1_conv2d_readvariableop_resource:		АА@
1prim_cap_conv2d_1_biasadd_readvariableop_resource:	АE
&digit_cap_tile_readvariableop_resource:А	

identityИвconv2d/BiasAdd/ReadVariableOpвconv2d/Conv2D/ReadVariableOpвdigit_cap/Tile/ReadVariableOpв(prim_cap/conv2d_1/BiasAdd/ReadVariableOpв'prim_cap/conv2d_1/Conv2D/ReadVariableOpЛ
conv2d/Conv2D/ReadVariableOpReadVariableOp%conv2d_conv2d_readvariableop_resource*'
_output_shapes
:		А*
dtype0й
conv2d/Conv2DConv2Dinputs$conv2d/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
Б
conv2d/BiasAdd/ReadVariableOpReadVariableOp&conv2d_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0У
conv2d/BiasAddBiasAddconv2d/Conv2D:output:0%conv2d/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         Аg
conv2d/ReluReluconv2d/BiasAdd:output:0*
T0*0
_output_shapes
:         Ав
'prim_cap/conv2d_1/Conv2D/ReadVariableOpReadVariableOp0prim_cap_conv2d_1_conv2d_readvariableop_resource*(
_output_shapes
:		АА*
dtype0╥
prim_cap/conv2d_1/Conv2DConv2Dconv2d/Relu:activations:0/prim_cap/conv2d_1/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:         А*
paddingVALID*
strides
Ч
(prim_cap/conv2d_1/BiasAdd/ReadVariableOpReadVariableOp1prim_cap_conv2d_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0┤
prim_cap/conv2d_1/BiasAddBiasAdd!prim_cap/conv2d_1/Conv2D:output:00prim_cap/conv2d_1/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:         Аs
prim_cap/Reshape/shapeConst*
_output_shapes
:*
dtype0*)
value B"                 Ю
prim_cap/ReshapeReshape"prim_cap/conv2d_1/BiasAdd:output:0prim_cap/Reshape/shape:output:0*
T0*3
_output_shapes!
:          t
prim_cap/transpose/permConst*
_output_shapes
:*
dtype0*)
value B"                Ъ
prim_cap/transpose	Transposeprim_cap/Reshape:output:0 prim_cap/transpose/perm:output:0*
T0*3
_output_shapes!
:          u
prim_cap/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*)
value B"    А           Ч
prim_cap/Reshape_1Reshapeprim_cap/transpose:y:0!prim_cap/Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :         А	t
prim_cap/Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"      
         У
prim_cap/TileTileprim_cap/Reshape_1:output:0 prim_cap/Tile/multiples:output:0*
T0*4
_output_shapes"
 :         А	
x
digit_cap/zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"   А     
   Z
digit_cap/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    У
digit_cap/zerosFill(digit_cap/zeros/shape_as_tensor:output:0digit_cap/zeros/Const:output:0*
T0*'
_output_shapes
:А	
С
digit_cap/Tile/ReadVariableOpReadVariableOp&digit_cap_tile_readvariableop_resource*+
_output_shapes
:А	
*
dtype0u
digit_cap/Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"               Ц
digit_cap/TileTile%digit_cap/Tile/ReadVariableOp:value:0!digit_cap/Tile/multiples:output:0*
T0*+
_output_shapes
:А	
h
digit_cap/SoftmaxSoftmaxdigit_cap/zeros:output:0*
T0*'
_output_shapes
:А	
С
digit_cap/MatMulBatchMatMulV2digit_cap/Tile:output:0prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
Й
digit_cap/SqueezeSqueezedigit_cap/MatMul:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
q
digit_cap/transpose/permConst*
_output_shapes
:*
dtype0*%
valueB"             Ъ
digit_cap/transpose	Transposedigit_cap/Squeeze:output:0!digit_cap/transpose/perm:output:0*
T0*0
_output_shapes
:         А	
Е
digit_cap/mulMuldigit_cap/Softmax:softmax:0digit_cap/transpose:y:0*
T0*0
_output_shapes
:         А	
a
digit_cap/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :З
digit_cap/SumSumdigit_cap/mul:z:0(digit_cap/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
l
digit_cap/Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   М
digit_cap/ReshapeReshapedigit_cap/Sum:output:0 digit_cap/Reshape/shape:output:0*
T0*+
_output_shapes
:         
З
digit_cap/norm/mulMuldigit_cap/Reshape:output:0digit_cap/Reshape:output:0*
T0*+
_output_shapes
:         
n
$digit_cap/norm/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:з
digit_cap/norm/SumSumdigit_cap/norm/mul:z:0-digit_cap/norm/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(n
digit_cap/norm/SqrtSqrtdigit_cap/norm/Sum:output:0*
T0*+
_output_shapes
:         o
digit_cap/Tile_1/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   М
digit_cap/Tile_1Tiledigit_cap/norm/Sqrt:y:0#digit_cap/Tile_1/multiples:output:0*
T0*+
_output_shapes
:         
Г
digit_cap/mul_1Muldigit_cap/Tile_1:output:0digit_cap/Reshape:output:0*
T0*+
_output_shapes
:         
T
digit_cap/pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @
digit_cap/powPowdigit_cap/Tile_1:output:0digit_cap/pow/y:output:0*
T0*+
_output_shapes
:         
T
digit_cap/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?y
digit_cap/addAddV2digit_cap/add/x:output:0digit_cap/pow:z:0*
T0*+
_output_shapes
:         
z
digit_cap/truedivRealDivdigit_cap/mul_1:z:0digit_cap/add:z:0*
T0*+
_output_shapes
:         
r
digit_cap/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   У
digit_cap/Reshape_1Reshapedigit_cap/truediv:z:0"digit_cap/Reshape_1/shape:output:0*
T0*/
_output_shapes
:         
s
digit_cap/Tile_2/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        Ц
digit_cap/Tile_2Tiledigit_cap/Reshape_1:output:0#digit_cap/Tile_2/multiples:output:0*
T0*0
_output_shapes
:         А	
Е
digit_cap/mul_2Muldigit_cap/Tile_2:output:0digit_cap/transpose:y:0*
T0*0
_output_shapes
:         А	
В
digit_cap/add_1AddV2digit_cap/zeros:output:0digit_cap/mul_2:z:0*
T0*0
_output_shapes
:         А	

digit_cap/norm_1/mulMuldigit_cap/truediv:z:0digit_cap/truediv:z:0*
T0*+
_output_shapes
:         
p
&digit_cap/norm_1/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:н
digit_cap/norm_1/SumSumdigit_cap/norm_1/mul:z:0/digit_cap/norm_1/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(r
digit_cap/norm_1/SqrtSqrtdigit_cap/norm_1/Sum:output:0*
T0*+
_output_shapes
:         
В
digit_cap/Squeeze_1Squeezedigit_cap/norm_1/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
n
digit_cap/Softmax_1Softmaxdigit_cap/add_1:z:0*
T0*0
_output_shapes
:         А	
У
digit_cap/MatMul_1BatchMatMulV2digit_cap/Tile:output:0prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
Н
digit_cap/Squeeze_2Squeezedigit_cap/MatMul_1:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
s
digit_cap/transpose_1/permConst*
_output_shapes
:*
dtype0*%
valueB"             а
digit_cap/transpose_1	Transposedigit_cap/Squeeze_2:output:0#digit_cap/transpose_1/perm:output:0*
T0*0
_output_shapes
:         А	
Л
digit_cap/mul_3Muldigit_cap/Softmax_1:softmax:0digit_cap/transpose_1:y:0*
T0*0
_output_shapes
:         А	
c
!digit_cap/Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :Н
digit_cap/Sum_1Sumdigit_cap/mul_3:z:0*digit_cap/Sum_1/reduction_indices:output:0*
T0*+
_output_shapes
:         
n
digit_cap/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   Т
digit_cap/Reshape_2Reshapedigit_cap/Sum_1:output:0"digit_cap/Reshape_2/shape:output:0*
T0*+
_output_shapes
:         
Н
digit_cap/norm_2/mulMuldigit_cap/Reshape_2:output:0digit_cap/Reshape_2:output:0*
T0*+
_output_shapes
:         
p
&digit_cap/norm_2/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:н
digit_cap/norm_2/SumSumdigit_cap/norm_2/mul:z:0/digit_cap/norm_2/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(r
digit_cap/norm_2/SqrtSqrtdigit_cap/norm_2/Sum:output:0*
T0*+
_output_shapes
:         o
digit_cap/Tile_3/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   О
digit_cap/Tile_3Tiledigit_cap/norm_2/Sqrt:y:0#digit_cap/Tile_3/multiples:output:0*
T0*+
_output_shapes
:         
Е
digit_cap/mul_4Muldigit_cap/Tile_3:output:0digit_cap/Reshape_2:output:0*
T0*+
_output_shapes
:         
V
digit_cap/pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @Г
digit_cap/pow_1Powdigit_cap/Tile_3:output:0digit_cap/pow_1/y:output:0*
T0*+
_output_shapes
:         
V
digit_cap/add_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
digit_cap/add_2AddV2digit_cap/add_2/x:output:0digit_cap/pow_1:z:0*
T0*+
_output_shapes
:         
~
digit_cap/truediv_1RealDivdigit_cap/mul_4:z:0digit_cap/add_2:z:0*
T0*+
_output_shapes
:         
r
digit_cap/Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   Х
digit_cap/Reshape_3Reshapedigit_cap/truediv_1:z:0"digit_cap/Reshape_3/shape:output:0*
T0*/
_output_shapes
:         
s
digit_cap/Tile_4/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        Ц
digit_cap/Tile_4Tiledigit_cap/Reshape_3:output:0#digit_cap/Tile_4/multiples:output:0*
T0*0
_output_shapes
:         А	
З
digit_cap/mul_5Muldigit_cap/Tile_4:output:0digit_cap/transpose_1:y:0*
T0*0
_output_shapes
:         А	
}
digit_cap/add_3AddV2digit_cap/add_1:z:0digit_cap/mul_5:z:0*
T0*0
_output_shapes
:         А	
Г
digit_cap/norm_3/mulMuldigit_cap/truediv_1:z:0digit_cap/truediv_1:z:0*
T0*+
_output_shapes
:         
p
&digit_cap/norm_3/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:н
digit_cap/norm_3/SumSumdigit_cap/norm_3/mul:z:0/digit_cap/norm_3/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(r
digit_cap/norm_3/SqrtSqrtdigit_cap/norm_3/Sum:output:0*
T0*+
_output_shapes
:         
В
digit_cap/Squeeze_3Squeezedigit_cap/norm_3/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
n
digit_cap/Softmax_2Softmaxdigit_cap/add_3:z:0*
T0*0
_output_shapes
:         А	
У
digit_cap/MatMul_2BatchMatMulV2digit_cap/Tile:output:0prim_cap/Tile:output:0*
T0*4
_output_shapes"
 :         А	
Н
digit_cap/Squeeze_4Squeezedigit_cap/MatMul_2:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
s
digit_cap/transpose_2/permConst*
_output_shapes
:*
dtype0*%
valueB"             а
digit_cap/transpose_2	Transposedigit_cap/Squeeze_4:output:0#digit_cap/transpose_2/perm:output:0*
T0*0
_output_shapes
:         А	
Л
digit_cap/mul_6Muldigit_cap/Softmax_2:softmax:0digit_cap/transpose_2:y:0*
T0*0
_output_shapes
:         А	
c
!digit_cap/Sum_2/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :Н
digit_cap/Sum_2Sumdigit_cap/mul_6:z:0*digit_cap/Sum_2/reduction_indices:output:0*
T0*+
_output_shapes
:         
n
digit_cap/Reshape_4/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   Т
digit_cap/Reshape_4Reshapedigit_cap/Sum_2:output:0"digit_cap/Reshape_4/shape:output:0*
T0*+
_output_shapes
:         
Н
digit_cap/norm_4/mulMuldigit_cap/Reshape_4:output:0digit_cap/Reshape_4:output:0*
T0*+
_output_shapes
:         
p
&digit_cap/norm_4/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:н
digit_cap/norm_4/SumSumdigit_cap/norm_4/mul:z:0/digit_cap/norm_4/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(r
digit_cap/norm_4/SqrtSqrtdigit_cap/norm_4/Sum:output:0*
T0*+
_output_shapes
:         o
digit_cap/Tile_5/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   О
digit_cap/Tile_5Tiledigit_cap/norm_4/Sqrt:y:0#digit_cap/Tile_5/multiples:output:0*
T0*+
_output_shapes
:         
Е
digit_cap/mul_7Muldigit_cap/Tile_5:output:0digit_cap/Reshape_4:output:0*
T0*+
_output_shapes
:         
V
digit_cap/pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @Г
digit_cap/pow_2Powdigit_cap/Tile_5:output:0digit_cap/pow_2/y:output:0*
T0*+
_output_shapes
:         
V
digit_cap/add_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?
digit_cap/add_4AddV2digit_cap/add_4/x:output:0digit_cap/pow_2:z:0*
T0*+
_output_shapes
:         
~
digit_cap/truediv_2RealDivdigit_cap/mul_7:z:0digit_cap/add_4:z:0*
T0*+
_output_shapes
:         
r
digit_cap/Reshape_5/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   Х
digit_cap/Reshape_5Reshapedigit_cap/truediv_2:z:0"digit_cap/Reshape_5/shape:output:0*
T0*/
_output_shapes
:         
s
digit_cap/Tile_6/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        Ц
digit_cap/Tile_6Tiledigit_cap/Reshape_5:output:0#digit_cap/Tile_6/multiples:output:0*
T0*0
_output_shapes
:         А	
З
digit_cap/mul_8Muldigit_cap/Tile_6:output:0digit_cap/transpose_2:y:0*
T0*0
_output_shapes
:         А	
}
digit_cap/add_5AddV2digit_cap/add_3:z:0digit_cap/mul_8:z:0*
T0*0
_output_shapes
:         А	
Г
digit_cap/norm_5/mulMuldigit_cap/truediv_2:z:0digit_cap/truediv_2:z:0*
T0*+
_output_shapes
:         
p
&digit_cap/norm_5/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:н
digit_cap/norm_5/SumSumdigit_cap/norm_5/mul:z:0/digit_cap/norm_5/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(r
digit_cap/norm_5/SqrtSqrtdigit_cap/norm_5/Sum:output:0*
T0*+
_output_shapes
:         
В
digit_cap/Squeeze_5Squeezedigit_cap/norm_5/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
b
SoftmaxSoftmaxdigit_cap/Squeeze_5:output:0*
T0*'
_output_shapes
:         
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:         
·
NoOpNoOp^conv2d/BiasAdd/ReadVariableOp^conv2d/Conv2D/ReadVariableOp^digit_cap/Tile/ReadVariableOp)^prim_cap/conv2d_1/BiasAdd/ReadVariableOp(^prim_cap/conv2d_1/Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 2>
conv2d/BiasAdd/ReadVariableOpconv2d/BiasAdd/ReadVariableOp2<
conv2d/Conv2D/ReadVariableOpconv2d/Conv2D/ReadVariableOp2>
digit_cap/Tile/ReadVariableOpdigit_cap/Tile/ReadVariableOp2T
(prim_cap/conv2d_1/BiasAdd/ReadVariableOp(prim_cap/conv2d_1/BiasAdd/ReadVariableOp2R
'prim_cap/conv2d_1/Conv2D/ReadVariableOp'prim_cap/conv2d_1/Conv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
З]
╡
C__inference_digit_cap_layer_call_and_return_conditional_losses_4309

inputs;
tile_readvariableop_resource:А	

identityИвTile/ReadVariableOpn
zeros/shape_as_tensorConst*
_output_shapes
:*
dtype0*%
valueB"   А     
   P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    u
zerosFillzeros/shape_as_tensor:output:0zeros/Const:output:0*
T0*'
_output_shapes
:А	
}
Tile/ReadVariableOpReadVariableOptile_readvariableop_resource*+
_output_shapes
:А	
*
dtype0k
Tile/multiplesConst*
_output_shapes
:*
dtype0*)
value B"               x
TileTileTile/ReadVariableOp:value:0Tile/multiples:output:0*
T0*+
_output_shapes
:А	
T
SoftmaxSoftmaxzeros:output:0*
T0*'
_output_shapes
:А	
m
MatMulBatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
u
SqueezeSqueezeMatMul:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
g
transpose/permConst*
_output_shapes
:*
dtype0*%
valueB"             |
	transpose	TransposeSqueeze:output:0transpose/perm:output:0*
T0*0
_output_shapes
:         А	
g
mulMulSoftmax:softmax:0transpose:y:0*
T0*0
_output_shapes
:         А	
W
Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :i
SumSummul:z:0Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
b
Reshape/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   n
ReshapeReshapeSum:output:0Reshape/shape:output:0*
T0*+
_output_shapes
:         
i
norm/mulMulReshape:output:0Reshape:output:0*
T0*+
_output_shapes
:         
d
norm/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Й
norm/SumSumnorm/mul:z:0#norm/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(Z
	norm/SqrtSqrtnorm/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_1/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   n
Tile_1Tilenorm/Sqrt:y:0Tile_1/multiples:output:0*
T0*+
_output_shapes
:         
e
mul_1MulTile_1:output:0Reshape:output:0*
T0*+
_output_shapes
:         
J
pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @a
powPowTile_1:output:0pow/y:output:0*
T0*+
_output_shapes
:         
J
add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?[
addAddV2add/x:output:0pow:z:0*
T0*+
_output_shapes
:         
\
truedivRealDiv	mul_1:z:0add:z:0*
T0*+
_output_shapes
:         
h
Reshape_1/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   u
	Reshape_1Reshapetruediv:z:0Reshape_1/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_2/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_2TileReshape_1:output:0Tile_2/multiples:output:0*
T0*0
_output_shapes
:         А	
g
mul_2MulTile_2:output:0transpose:y:0*
T0*0
_output_shapes
:         А	
d
add_1AddV2zeros:output:0	mul_2:z:0*
T0*0
_output_shapes
:         А	
a

norm_1/mulMultruediv:z:0truediv:z:0*
T0*+
_output_shapes
:         
f
norm_1/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_1/SumSumnorm_1/mul:z:0%norm_1/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_1/SqrtSqrtnorm_1/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_1Squeezenorm_1/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
Z
	Softmax_1Softmax	add_1:z:0*
T0*0
_output_shapes
:         А	
o
MatMul_1BatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
y
	Squeeze_2SqueezeMatMul_1:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
i
transpose_1/permConst*
_output_shapes
:*
dtype0*%
valueB"             В
transpose_1	TransposeSqueeze_2:output:0transpose_1/perm:output:0*
T0*0
_output_shapes
:         А	
m
mul_3MulSoftmax_1:softmax:0transpose_1:y:0*
T0*0
_output_shapes
:         А	
Y
Sum_1/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :o
Sum_1Sum	mul_3:z:0 Sum_1/reduction_indices:output:0*
T0*+
_output_shapes
:         
d
Reshape_2/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   t
	Reshape_2ReshapeSum_1:output:0Reshape_2/shape:output:0*
T0*+
_output_shapes
:         
o

norm_2/mulMulReshape_2:output:0Reshape_2:output:0*
T0*+
_output_shapes
:         
f
norm_2/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_2/SumSumnorm_2/mul:z:0%norm_2/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(^
norm_2/SqrtSqrtnorm_2/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_3/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   p
Tile_3Tilenorm_2/Sqrt:y:0Tile_3/multiples:output:0*
T0*+
_output_shapes
:         
g
mul_4MulTile_3:output:0Reshape_2:output:0*
T0*+
_output_shapes
:         
L
pow_1/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
pow_1PowTile_3:output:0pow_1/y:output:0*
T0*+
_output_shapes
:         
L
add_2/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
add_2AddV2add_2/x:output:0	pow_1:z:0*
T0*+
_output_shapes
:         
`
	truediv_1RealDiv	mul_4:z:0	add_2:z:0*
T0*+
_output_shapes
:         
h
Reshape_3/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   w
	Reshape_3Reshapetruediv_1:z:0Reshape_3/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_4/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_4TileReshape_3:output:0Tile_4/multiples:output:0*
T0*0
_output_shapes
:         А	
i
mul_5MulTile_4:output:0transpose_1:y:0*
T0*0
_output_shapes
:         А	
_
add_3AddV2	add_1:z:0	mul_5:z:0*
T0*0
_output_shapes
:         А	
e

norm_3/mulMultruediv_1:z:0truediv_1:z:0*
T0*+
_output_shapes
:         
f
norm_3/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_3/SumSumnorm_3/mul:z:0%norm_3/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_3/SqrtSqrtnorm_3/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_3Squeezenorm_3/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
Z
	Softmax_2Softmax	add_3:z:0*
T0*0
_output_shapes
:         А	
o
MatMul_2BatchMatMulV2Tile:output:0inputs*
T0*4
_output_shapes"
 :         А	
y
	Squeeze_4SqueezeMatMul_2:output:0*
T0*0
_output_shapes
:         А	
*
squeeze_dims
i
transpose_2/permConst*
_output_shapes
:*
dtype0*%
valueB"             В
transpose_2	TransposeSqueeze_4:output:0transpose_2/perm:output:0*
T0*0
_output_shapes
:         А	
m
mul_6MulSoftmax_2:softmax:0transpose_2:y:0*
T0*0
_output_shapes
:         А	
Y
Sum_2/reduction_indicesConst*
_output_shapes
: *
dtype0*
value	B :o
Sum_2Sum	mul_6:z:0 Sum_2/reduction_indices:output:0*
T0*+
_output_shapes
:         
d
Reshape_4/shapeConst*
_output_shapes
:*
dtype0*!
valueB"       
   t
	Reshape_4ReshapeSum_2:output:0Reshape_4/shape:output:0*
T0*+
_output_shapes
:         
o

norm_4/mulMulReshape_4:output:0Reshape_4:output:0*
T0*+
_output_shapes
:         
f
norm_4/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_4/SumSumnorm_4/mul:z:0%norm_4/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         *
	keep_dims(^
norm_4/SqrtSqrtnorm_4/Sum:output:0*
T0*+
_output_shapes
:         e
Tile_5/multiplesConst*
_output_shapes
:*
dtype0*!
valueB"      
   p
Tile_5Tilenorm_4/Sqrt:y:0Tile_5/multiples:output:0*
T0*+
_output_shapes
:         
g
mul_7MulTile_5:output:0Reshape_4:output:0*
T0*+
_output_shapes
:         
L
pow_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
pow_2PowTile_5:output:0pow_2/y:output:0*
T0*+
_output_shapes
:         
L
add_4/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?a
add_4AddV2add_4/x:output:0	pow_2:z:0*
T0*+
_output_shapes
:         
`
	truediv_2RealDiv	mul_7:z:0	add_4:z:0*
T0*+
_output_shapes
:         
h
Reshape_5/shapeConst*
_output_shapes
:*
dtype0*%
valueB"          
   w
	Reshape_5Reshapetruediv_2:z:0Reshape_5/shape:output:0*
T0*/
_output_shapes
:         
i
Tile_6/multiplesConst*
_output_shapes
:*
dtype0*%
valueB"   А        x
Tile_6TileReshape_5:output:0Tile_6/multiples:output:0*
T0*0
_output_shapes
:         А	
i
mul_8MulTile_6:output:0transpose_2:y:0*
T0*0
_output_shapes
:         А	
_
add_5AddV2	add_3:z:0	mul_8:z:0*
T0*0
_output_shapes
:         А	
e

norm_5/mulMultruediv_2:z:0truediv_2:z:0*
T0*+
_output_shapes
:         
f
norm_5/Sum/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:П

norm_5/SumSumnorm_5/mul:z:0%norm_5/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:         
*
	keep_dims(^
norm_5/SqrtSqrtnorm_5/Sum:output:0*
T0*+
_output_shapes
:         
n
	Squeeze_5Squeezenorm_5/Sqrt:y:0*
T0*'
_output_shapes
:         
*
squeeze_dims
a
IdentityIdentitySqueeze_5:output:0^NoOp*
T0*'
_output_shapes
:         
\
NoOpNoOp^Tile/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
":         А	
: 2*
Tile/ReadVariableOpTile/ReadVariableOp:\ X
4
_output_shapes"
 :         А	

 
_user_specified_nameinputs
╦
Е
"__inference_signature_wrapper_4412
input_1"
unknown:		А
	unknown_0:	А%
	unknown_1:		АА
	unknown_2:	А(
	unknown_3:А	

identityИвStatefulPartitionedCall▄
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         
*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8В *(
f#R!
__inference__wrapped_model_4150o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:         : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1"┐L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*│
serving_defaultЯ
C
input_18
serving_default_input_1:0         <
output_10
StatefulPartitionedCall:0         
tensorflow/serving/predict:Чh
Й
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	conv1
	prim_cap

	digit_cap
	optimizer

signatures"
_tf_keras_model
C
0
1
2
3
4"
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
 "
trackable_list_wrapper
╩
non_trainable_variables

layers
metrics
layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
╝
trace_0
trace_12Е
.__inference_capsule_network_layer_call_fn_4328
.__inference_capsule_network_layer_call_fn_4427в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 ztrace_0ztrace_1
Є
trace_0
trace_12╗
I__inference_capsule_network_layer_call_and_return_conditional_losses_4559
I__inference_capsule_network_layer_call_and_return_conditional_losses_4389в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 ztrace_0ztrace_1
╩B╟
__inference__wrapped_model_4150input_1"Ш
С▓Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
▌
	variables
trainable_variables
regularization_losses
	keras_api
__call__
* &call_and_return_all_conditional_losses

kernel
bias
 !_jit_compiled_convolution_op"
_tf_keras_layer
░
"	variables
#trainable_variables
$regularization_losses
%	keras_api
&__call__
*'&call_and_return_all_conditional_losses
	(conv2"
_tf_keras_layer
о
)	variables
*trainable_variables
+regularization_losses
,	keras_api
-__call__
*.&call_and_return_all_conditional_losses
wij"
_tf_keras_layer
н
/iter

0beta_1

1beta_2
	2decay
3learning_ratemambmcmdmevfvgvhvivj"
	optimizer
,
4serving_default"
signature_map
(:&		А2conv2d/kernel
:А2conv2d/bias
4:2		АА2prim_cap/conv2d_1/kernel
%:#А2prim_cap/conv2d_1/bias
,:*А	
2digit_cap/wij
 "
trackable_list_wrapper
5
0
	1

2"
trackable_list_wrapper
.
50
61"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
уBр
.__inference_capsule_network_layer_call_fn_4328input_1"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
тB▀
.__inference_capsule_network_layer_call_fn_4427inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
¤B·
I__inference_capsule_network_layer_call_and_return_conditional_losses_4559inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
■B√
I__inference_capsule_network_layer_call_and_return_conditional_losses_4389input_1"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
н
7non_trainable_variables

8layers
9metrics
:layer_regularization_losses
;layer_metrics
	variables
trainable_variables
regularization_losses
__call__
* &call_and_return_all_conditional_losses
& "call_and_return_conditional_losses"
_generic_user_object
щ
<trace_02╠
%__inference_conv2d_layer_call_fn_4568в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z<trace_0
Д
=trace_02ч
@__inference_conv2d_layer_call_and_return_conditional_losses_4579в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z=trace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
н
>non_trainable_variables

?layers
@metrics
Alayer_regularization_losses
Blayer_metrics
"	variables
#trainable_variables
$regularization_losses
&__call__
*'&call_and_return_all_conditional_losses
&'"call_and_return_conditional_losses"
_generic_user_object
ы
Ctrace_02╬
'__inference_prim_cap_layer_call_fn_4588в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zCtrace_0
Ж
Dtrace_02щ
B__inference_prim_cap_layer_call_and_return_conditional_losses_4606в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zDtrace_0
▌
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses

kernel
bias
 K_jit_compiled_convolution_op"
_tf_keras_layer
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
н
Lnon_trainable_variables

Mlayers
Nmetrics
Olayer_regularization_losses
Player_metrics
)	variables
*trainable_variables
+regularization_losses
-__call__
*.&call_and_return_all_conditional_losses
&."call_and_return_conditional_losses"
_generic_user_object
ь
Qtrace_02╧
(__inference_digit_cap_layer_call_fn_4613в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zQtrace_0
З
Rtrace_02ъ
C__inference_digit_cap_layer_call_and_return_conditional_losses_4723в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zRtrace_0
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
╔B╞
"__inference_signature_wrapper_4412input_1"Ф
Н▓Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
N
S	variables
T	keras_api
	Utotal
	Vcount"
_tf_keras_metric
^
W	variables
X	keras_api
	Ytotal
	Zcount
[
_fn_kwargs"
_tf_keras_metric
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┘B╓
%__inference_conv2d_layer_call_fn_4568inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЇBё
@__inference_conv2d_layer_call_and_return_conditional_losses_4579inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
'
(0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
█B╪
'__inference_prim_cap_layer_call_fn_4588inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЎBє
B__inference_prim_cap_layer_call_and_return_conditional_losses_4606inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
н
\non_trainable_variables

]layers
^metrics
_layer_regularization_losses
`layer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses"
_generic_user_object
и2ев
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
и2ев
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
▄B┘
(__inference_digit_cap_layer_call_fn_4613inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ўBЇ
C__inference_digit_cap_layer_call_and_return_conditional_losses_4723inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
U0
V1"
trackable_list_wrapper
-
S	variables"
_generic_user_object
:  (2total
:  (2count
.
Y0
Z1"
trackable_list_wrapper
-
W	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
-:+		А2Adam/conv2d/kernel/m
:А2Adam/conv2d/bias/m
9:7		АА2Adam/prim_cap/conv2d_1/kernel/m
*:(А2Adam/prim_cap/conv2d_1/bias/m
1:/А	
2Adam/digit_cap/wij/m
-:+		А2Adam/conv2d/kernel/v
:А2Adam/conv2d/bias/v
9:7		АА2Adam/prim_cap/conv2d_1/kernel/v
*:(А2Adam/prim_cap/conv2d_1/bias/v
1:/А	
2Adam/digit_cap/wij/vЩ
__inference__wrapped_model_4150v8в5
.в+
)К&
input_1         
к "3к0
.
output_1"К
output_1         
╡
I__inference_capsule_network_layer_call_and_return_conditional_losses_4389h8в5
.в+
)К&
input_1         
к "%в"
К
0         

Ъ ┤
I__inference_capsule_network_layer_call_and_return_conditional_losses_4559g7в4
-в*
(К%
inputs         
к "%в"
К
0         

Ъ Н
.__inference_capsule_network_layer_call_fn_4328[8в5
.в+
)К&
input_1         
к "К         
М
.__inference_capsule_network_layer_call_fn_4427Z7в4
-в*
(К%
inputs         
к "К         
▒
@__inference_conv2d_layer_call_and_return_conditional_losses_4579m7в4
-в*
(К%
inputs         
к ".в+
$К!
0         А
Ъ Й
%__inference_conv2d_layer_call_fn_4568`7в4
-в*
(К%
inputs         
к "!К         Ап
C__inference_digit_cap_layer_call_and_return_conditional_losses_4723h<в9
2в/
-К*
inputs         А	

к "%в"
К
0         

Ъ З
(__inference_digit_cap_layer_call_fn_4613[<в9
2в/
-К*
inputs         А	

к "К         
╕
B__inference_prim_cap_layer_call_and_return_conditional_losses_4606r8в5
.в+
)К&
inputs         А
к "2в/
(К%
0         А	

Ъ Р
'__inference_prim_cap_layer_call_fn_4588e8в5
.в+
)К&
inputs         А
к "%К"         А	
и
"__inference_signature_wrapper_4412БCв@
в 
9к6
4
input_1)К&
input_1         "3к0
.
output_1"К
output_1         
