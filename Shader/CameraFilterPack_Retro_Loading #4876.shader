//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Retro_Loading" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 42551
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _TimeX;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec3 u_xlatb4;
bool u_xlatb5;
vec2 u_xlat8;
vec2 u_xlat9;
float u_xlat12;
void main()
{
    u_xlat0.x = _TimeX + 1.0;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.y = _Value * _TimeX;
    u_xlat0.x = u_xlat0.y * 50.0 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xy * vec2(0.00066666666, 10.0);
    u_xlat1.x = floor(u_xlat0.y);
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 30.0;
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat8.x = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 30.0;
    u_xlat4.x = (u_xlatb4.x) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat4.x = u_xlat4.x * 50.0;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat9.xy = u_xlat8.xy * vec2(50.0, 30.0);
    u_xlat2 = texture(_MainTex, u_xlat8.xy);
    u_xlat8.xy = floor(u_xlat9.xy);
    u_xlatb4.x = u_xlat8.x>=u_xlat4.x;
    u_xlat8.x = u_xlat8.y + 1.0;
    u_xlatb0.z = u_xlat8.x>=u_xlat0.x;
    u_xlatb0.x = u_xlat8.y>=u_xlat0.x;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat4.x = (u_xlatb4.x) ? 0.0 : u_xlat0.z;
    u_xlat0.x = u_xlat4.x + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = _TimeX * 10.0;
    u_xlat1.y = floor(u_xlat4.x);
    u_xlat4.xy = u_xlat1.xy * vec2(-1.0, 0.0);
    u_xlat1.x = u_xlat8.y * 0.5;
    u_xlat12 = sin(u_xlat8.y);
    u_xlat12 = u_xlat12 * 10000.0;
    u_xlat12 = fract(u_xlat12);
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : (-u_xlat1.x);
    u_xlatb1 = u_xlat1.x>=0.5;
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat4.xy = u_xlat4.xy * u_xlat1.xx;
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat12) + u_xlat9.xy;
    u_xlat12 = fract(u_xlat9.y);
    u_xlatb4.z = u_xlat12>=0.100000001;
    u_xlat1.xy = floor(u_xlat4.xy);
    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.y = u_xlat0.x * u_xlat1.x;
    u_xlat3 = u_xlat4.xyxy + vec4(0.100000001, 0.0, -0.100000001, -0.0);
    u_xlat4.x = fract(u_xlat4.x);
    u_xlatb4.x = u_xlat4.x>=0.100000001;
    u_xlat4.x = u_xlatb4.x ? float(1.0) : 0.0;
    u_xlat4.z = u_xlatb4.z ? float(1.0) : 0.0;
;
    u_xlat4.x = u_xlat4.z * u_xlat4.x;
    u_xlat3 = floor(u_xlat3);
    u_xlat8.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
    u_xlat8.y = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.xz = u_xlat8.xy * u_xlat0.xx;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * vec3(4.0, 4.0, 4.0);
    u_xlat0.xzw = min(u_xlat0.xzw, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat0.xzw * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xyz;
    u_xlatb0.xzw = greaterThanEqual(u_xlat0.xxzw, vec4(0.25, 0.0, 0.25, 0.25)).xzw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    SV_Target0.xyz = u_xlat0.xzw * u_xlat4.xxx + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 465
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %138 %452 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpMemberDecorate %10 0 Offset 10 
                                              OpMemberDecorate %10 1 Offset 10 
                                              OpMemberDecorate %10 2 Offset 10 
                                              OpDecorate %10 Block 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate vs_TEXCOORD0 Location 138 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %161 DescriptorSet 161 
                                              OpDecorate %161 Binding 161 
                                              OpDecorate %452 Location 452 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %6 %6 %7 
                                      %11 = OpTypePointer Uniform %10 
   Uniform struct {f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 0 
                                      %15 = OpTypePointer Uniform %6 
                                  f32 %18 = OpConstant 3.674022E-40 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 0 
                                      %22 = OpTypePointer Private %6 
                                  i32 %28 = OpConstant 1 
                                  u32 %34 = OpConstant 1 
                                  f32 %38 = OpConstant 3.674022E-40 
                                      %44 = OpTypeVector %6 2 
                                  f32 %47 = OpConstant 3.674022E-40 
                                  f32 %48 = OpConstant 3.674022E-40 
                                f32_2 %49 = OpConstantComposite %47 %48 
                                      %53 = OpTypeVector %6 3 
                                      %54 = OpTypePointer Private %53 
                       Private f32_3* %55 = OpVariable Private 
                                      %60 = OpTypeBool 
                                      %61 = OpTypeVector %60 3 
                                      %62 = OpTypePointer Private %61 
                      Private bool_3* %63 = OpVariable Private 
                                      %70 = OpTypePointer Private %60 
                                      %79 = OpTypePointer Function %6 
                                  f32 %93 = OpConstant 3.674022E-40 
                                     %103 = OpTypePointer Private %44 
                      Private f32_2* %104 = OpVariable Private 
                      Private f32_3* %119 = OpVariable Private 
                                     %137 = OpTypePointer Input %44 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %140 = OpConstant 2 
                                     %141 = OpTypePointer Uniform %7 
                      Private f32_2* %150 = OpVariable Private 
                               f32_2 %152 = OpConstantComposite %38 %93 
                      Private f32_3* %154 = OpVariable Private 
                                     %155 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %156 = OpTypePointer UniformConstant %155 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
                                     %159 = OpTypeSampler 
                                     %160 = OpTypePointer UniformConstant %159 
            UniformConstant sampler* %161 = OpVariable UniformConstant 
                                     %163 = OpTypeSampledImage %155 
                                     %180 = OpTypeVector %60 4 
                                     %181 = OpTypePointer Private %180 
                     Private bool_4* %182 = OpVariable Private 
                                 u32 %188 = OpConstant 2 
                                 f32 %198 = OpConstant 3.674022E-40 
                                 f32 %235 = OpConstant 3.674022E-40 
                               f32_2 %236 = OpConstantComposite %235 %198 
                                 f32 %242 = OpConstant 3.674022E-40 
                        Private f32* %245 = OpVariable Private 
                                 f32 %250 = OpConstant 3.674022E-40 
                       Private bool* %254 = OpVariable Private 
                       Private bool* %278 = OpVariable Private 
                                 f32 %305 = OpConstant 3.674022E-40 
                                 f32 %315 = OpConstant 3.674022E-40 
                                 f32 %316 = OpConstant 3.674022E-40 
                               f32_2 %317 = OpConstantComposite %315 %316 
                                 f32 %326 = OpConstant 3.674022E-40 
                      Private f32_4* %339 = OpVariable Private 
                                 f32 %342 = OpConstant 3.674022E-40 
                                 f32 %343 = OpConstant 3.674022E-40 
                               f32_4 %344 = OpConstantComposite %305 %198 %342 %343 
                               f32_2 %381 = OpConstantComposite %326 %326 
                                 f32 %398 = OpConstant 3.674022E-40 
                               f32_3 %399 = OpConstantComposite %398 %398 %398 
                               f32_3 %405 = OpConstantComposite %18 %18 %18 
                                 f32 %411 = OpConstant 3.674022E-40 
                               f32_3 %412 = OpConstantComposite %411 %411 %411 
                                 f32 %414 = OpConstant 3.674022E-40 
                               f32_3 %415 = OpConstantComposite %414 %414 %414 
                                 f32 %432 = OpConstant 3.674022E-40 
                               f32_4 %433 = OpConstantComposite %432 %198 %432 %432 
                                 u32 %446 = OpConstant 3 
                                     %451 = OpTypePointer Output %7 
                       Output f32_4* %452 = OpVariable Output 
                                     %462 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function f32* %80 = OpVariable Function 
                       Function f32* %122 = OpVariable Function 
                       Function f32* %207 = OpVariable Function 
                       Function f32* %267 = OpVariable Function 
                         Uniform f32* %16 = OpAccessChain %12 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %19 = OpFAdd %17 %18 
                         Private f32* %23 = OpAccessChain %9 %21 
                                              OpStore %23 %19 
                         Private f32* %24 = OpAccessChain %9 %21 
                                  f32 %25 = OpLoad %24 
                                  f32 %26 = OpExtInst %1 8 %25 
                         Private f32* %27 = OpAccessChain %9 %21 
                                              OpStore %27 %26 
                         Uniform f32* %29 = OpAccessChain %12 %28 
                                  f32 %30 = OpLoad %29 
                         Uniform f32* %31 = OpAccessChain %12 %14 
                                  f32 %32 = OpLoad %31 
                                  f32 %33 = OpFMul %30 %32 
                         Private f32* %35 = OpAccessChain %9 %34 
                                              OpStore %35 %33 
                         Private f32* %36 = OpAccessChain %9 %34 
                                  f32 %37 = OpLoad %36 
                                  f32 %39 = OpFMul %37 %38 
                         Private f32* %40 = OpAccessChain %9 %21 
                                  f32 %41 = OpLoad %40 
                                  f32 %42 = OpFAdd %39 %41 
                         Private f32* %43 = OpAccessChain %9 %21 
                                              OpStore %43 %42 
                                f32_4 %45 = OpLoad %9 
                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                f32_2 %50 = OpFMul %46 %49 
                                f32_4 %51 = OpLoad %9 
                                f32_4 %52 = OpVectorShuffle %51 %50 4 5 2 3 
                                              OpStore %9 %52 
                         Private f32* %56 = OpAccessChain %9 %34 
                                  f32 %57 = OpLoad %56 
                                  f32 %58 = OpExtInst %1 8 %57 
                         Private f32* %59 = OpAccessChain %55 %21 
                                              OpStore %59 %58 
                         Private f32* %64 = OpAccessChain %9 %21 
                                  f32 %65 = OpLoad %64 
                         Private f32* %66 = OpAccessChain %9 %21 
                                  f32 %67 = OpLoad %66 
                                  f32 %68 = OpFNegate %67 
                                 bool %69 = OpFOrdGreaterThanEqual %65 %68 
                        Private bool* %71 = OpAccessChain %63 %21 
                                              OpStore %71 %69 
                         Private f32* %72 = OpAccessChain %9 %21 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpExtInst %1 4 %73 
                                  f32 %75 = OpExtInst %1 10 %74 
                         Private f32* %76 = OpAccessChain %9 %21 
                                              OpStore %76 %75 
                        Private bool* %77 = OpAccessChain %63 %21 
                                 bool %78 = OpLoad %77 
                                              OpSelectionMerge %82 None 
                                              OpBranchConditional %78 %81 %85 
                                      %81 = OpLabel 
                         Private f32* %83 = OpAccessChain %9 %21 
                                  f32 %84 = OpLoad %83 
                                              OpStore %80 %84 
                                              OpBranch %82 
                                      %85 = OpLabel 
                         Private f32* %86 = OpAccessChain %9 %21 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                                              OpStore %80 %88 
                                              OpBranch %82 
                                      %82 = OpLabel 
                                  f32 %89 = OpLoad %80 
                         Private f32* %90 = OpAccessChain %9 %21 
                                              OpStore %90 %89 
                         Private f32* %91 = OpAccessChain %9 %21 
                                  f32 %92 = OpLoad %91 
                                  f32 %94 = OpFMul %92 %93 
                         Private f32* %95 = OpAccessChain %9 %21 
                                              OpStore %95 %94 
                         Private f32* %96 = OpAccessChain %9 %21 
                                  f32 %97 = OpLoad %96 
                         Private f32* %98 = OpAccessChain %9 %21 
                                  f32 %99 = OpLoad %98 
                                 f32 %100 = OpFNegate %99 
                                bool %101 = OpFOrdGreaterThanEqual %97 %100 
                       Private bool* %102 = OpAccessChain %63 %21 
                                              OpStore %102 %101 
                        Private f32* %105 = OpAccessChain %9 %21 
                                 f32 %106 = OpLoad %105 
                                 f32 %107 = OpExtInst %1 4 %106 
                                 f32 %108 = OpExtInst %1 10 %107 
                        Private f32* %109 = OpAccessChain %104 %21 
                                              OpStore %109 %108 
                        Private f32* %110 = OpAccessChain %9 %21 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpExtInst %1 8 %111 
                        Private f32* %113 = OpAccessChain %9 %21 
                                              OpStore %113 %112 
                        Private f32* %114 = OpAccessChain %9 %21 
                                 f32 %115 = OpLoad %114 
                                 f32 %116 = OpFNegate %115 
                                 f32 %117 = OpFAdd %116 %93 
                        Private f32* %118 = OpAccessChain %9 %21 
                                              OpStore %118 %117 
                       Private bool* %120 = OpAccessChain %63 %21 
                                bool %121 = OpLoad %120 
                                              OpSelectionMerge %124 None 
                                              OpBranchConditional %121 %123 %127 
                                     %123 = OpLabel 
                        Private f32* %125 = OpAccessChain %104 %21 
                                 f32 %126 = OpLoad %125 
                                              OpStore %122 %126 
                                              OpBranch %124 
                                     %127 = OpLabel 
                        Private f32* %128 = OpAccessChain %104 %21 
                                 f32 %129 = OpLoad %128 
                                 f32 %130 = OpFNegate %129 
                                              OpStore %122 %130 
                                              OpBranch %124 
                                     %124 = OpLabel 
                                 f32 %131 = OpLoad %122 
                        Private f32* %132 = OpAccessChain %119 %21 
                                              OpStore %132 %131 
                        Private f32* %133 = OpAccessChain %119 %21 
                                 f32 %134 = OpLoad %133 
                                 f32 %135 = OpFMul %134 %38 
                        Private f32* %136 = OpAccessChain %119 %21 
                                              OpStore %136 %135 
                               f32_2 %139 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %142 = OpAccessChain %12 %140 
                               f32_4 %143 = OpLoad %142 
                               f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                               f32_2 %145 = OpFMul %139 %144 
                      Uniform f32_4* %146 = OpAccessChain %12 %140 
                               f32_4 %147 = OpLoad %146 
                               f32_2 %148 = OpVectorShuffle %147 %147 2 3 
                               f32_2 %149 = OpFAdd %145 %148 
                                              OpStore %104 %149 
                               f32_2 %151 = OpLoad %104 
                               f32_2 %153 = OpFMul %151 %152 
                                              OpStore %150 %153 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %162 = OpLoad %161 
          read_only Texture2DSampled %164 = OpSampledImage %158 %162 
                               f32_2 %165 = OpLoad %104 
                               f32_4 %166 = OpImageSampleImplicitLod %164 %165 
                               f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                              OpStore %154 %167 
                               f32_2 %168 = OpLoad %150 
                               f32_2 %169 = OpExtInst %1 8 %168 
                                              OpStore %104 %169 
                        Private f32* %170 = OpAccessChain %104 %21 
                                 f32 %171 = OpLoad %170 
                        Private f32* %172 = OpAccessChain %119 %21 
                                 f32 %173 = OpLoad %172 
                                bool %174 = OpFOrdGreaterThanEqual %171 %173 
                       Private bool* %175 = OpAccessChain %63 %21 
                                              OpStore %175 %174 
                        Private f32* %176 = OpAccessChain %104 %34 
                                 f32 %177 = OpLoad %176 
                                 f32 %178 = OpFAdd %177 %18 
                        Private f32* %179 = OpAccessChain %104 %21 
                                              OpStore %179 %178 
                        Private f32* %183 = OpAccessChain %104 %21 
                                 f32 %184 = OpLoad %183 
                        Private f32* %185 = OpAccessChain %9 %21 
                                 f32 %186 = OpLoad %185 
                                bool %187 = OpFOrdGreaterThanEqual %184 %186 
                       Private bool* %189 = OpAccessChain %182 %188 
                                              OpStore %189 %187 
                        Private f32* %190 = OpAccessChain %104 %34 
                                 f32 %191 = OpLoad %190 
                        Private f32* %192 = OpAccessChain %9 %21 
                                 f32 %193 = OpLoad %192 
                                bool %194 = OpFOrdGreaterThanEqual %191 %193 
                       Private bool* %195 = OpAccessChain %182 %21 
                                              OpStore %195 %194 
                       Private bool* %196 = OpAccessChain %182 %21 
                                bool %197 = OpLoad %196 
                                 f32 %199 = OpSelect %197 %18 %198 
                        Private f32* %200 = OpAccessChain %9 %21 
                                              OpStore %200 %199 
                       Private bool* %201 = OpAccessChain %182 %188 
                                bool %202 = OpLoad %201 
                                 f32 %203 = OpSelect %202 %18 %198 
                        Private f32* %204 = OpAccessChain %9 %188 
                                              OpStore %204 %203 
                       Private bool* %205 = OpAccessChain %63 %21 
                                bool %206 = OpLoad %205 
                                              OpSelectionMerge %209 None 
                                              OpBranchConditional %206 %208 %210 
                                     %208 = OpLabel 
                                              OpStore %207 %198 
                                              OpBranch %209 
                                     %210 = OpLabel 
                        Private f32* %211 = OpAccessChain %9 %188 
                                 f32 %212 = OpLoad %211 
                                              OpStore %207 %212 
                                              OpBranch %209 
                                     %209 = OpLabel 
                                 f32 %213 = OpLoad %207 
                        Private f32* %214 = OpAccessChain %119 %21 
                                              OpStore %214 %213 
                        Private f32* %215 = OpAccessChain %119 %21 
                                 f32 %216 = OpLoad %215 
                        Private f32* %217 = OpAccessChain %9 %21 
                                 f32 %218 = OpLoad %217 
                                 f32 %219 = OpFAdd %216 %218 
                        Private f32* %220 = OpAccessChain %9 %21 
                                              OpStore %220 %219 
                        Private f32* %221 = OpAccessChain %9 %21 
                                 f32 %222 = OpLoad %221 
                                 f32 %223 = OpExtInst %1 37 %222 %18 
                        Private f32* %224 = OpAccessChain %9 %21 
                                              OpStore %224 %223 
                        Uniform f32* %225 = OpAccessChain %12 %14 
                                 f32 %226 = OpLoad %225 
                                 f32 %227 = OpFMul %226 %48 
                        Private f32* %228 = OpAccessChain %119 %21 
                                              OpStore %228 %227 
                        Private f32* %229 = OpAccessChain %119 %21 
                                 f32 %230 = OpLoad %229 
                                 f32 %231 = OpExtInst %1 8 %230 
                        Private f32* %232 = OpAccessChain %55 %34 
                                              OpStore %232 %231 
                               f32_3 %233 = OpLoad %55 
                               f32_2 %234 = OpVectorShuffle %233 %233 0 1 
                               f32_2 %237 = OpFMul %234 %236 
                               f32_3 %238 = OpLoad %119 
                               f32_3 %239 = OpVectorShuffle %238 %237 3 4 2 
                                              OpStore %119 %239 
                        Private f32* %240 = OpAccessChain %104 %34 
                                 f32 %241 = OpLoad %240 
                                 f32 %243 = OpFMul %241 %242 
                        Private f32* %244 = OpAccessChain %55 %21 
                                              OpStore %244 %243 
                        Private f32* %246 = OpAccessChain %104 %34 
                                 f32 %247 = OpLoad %246 
                                 f32 %248 = OpExtInst %1 13 %247 
                                              OpStore %245 %248 
                                 f32 %249 = OpLoad %245 
                                 f32 %251 = OpFMul %249 %250 
                                              OpStore %245 %251 
                                 f32 %252 = OpLoad %245 
                                 f32 %253 = OpExtInst %1 10 %252 
                                              OpStore %245 %253 
                        Private f32* %255 = OpAccessChain %55 %21 
                                 f32 %256 = OpLoad %255 
                        Private f32* %257 = OpAccessChain %55 %21 
                                 f32 %258 = OpLoad %257 
                                 f32 %259 = OpFNegate %258 
                                bool %260 = OpFOrdGreaterThanEqual %256 %259 
                                              OpStore %254 %260 
                        Private f32* %261 = OpAccessChain %55 %21 
                                 f32 %262 = OpLoad %261 
                                 f32 %263 = OpExtInst %1 4 %262 
                                 f32 %264 = OpExtInst %1 10 %263 
                        Private f32* %265 = OpAccessChain %55 %21 
                                              OpStore %265 %264 
                                bool %266 = OpLoad %254 
                                              OpSelectionMerge %269 None 
                                              OpBranchConditional %266 %268 %272 
                                     %268 = OpLabel 
                        Private f32* %270 = OpAccessChain %55 %21 
                                 f32 %271 = OpLoad %270 
                                              OpStore %267 %271 
                                              OpBranch %269 
                                     %272 = OpLabel 
                        Private f32* %273 = OpAccessChain %55 %21 
                                 f32 %274 = OpLoad %273 
                                 f32 %275 = OpFNegate %274 
                                              OpStore %267 %275 
                                              OpBranch %269 
                                     %269 = OpLabel 
                                 f32 %276 = OpLoad %267 
                        Private f32* %277 = OpAccessChain %55 %21 
                                              OpStore %277 %276 
                        Private f32* %279 = OpAccessChain %55 %21 
                                 f32 %280 = OpLoad %279 
                                bool %281 = OpFOrdGreaterThanEqual %280 %242 
                                              OpStore %278 %281 
                                bool %282 = OpLoad %278 
                                 f32 %283 = OpSelect %282 %18 %235 
                        Private f32* %284 = OpAccessChain %55 %21 
                                              OpStore %284 %283 
                               f32_3 %285 = OpLoad %119 
                               f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                               f32_3 %287 = OpLoad %55 
                               f32_2 %288 = OpVectorShuffle %287 %287 0 0 
                               f32_2 %289 = OpFMul %286 %288 
                               f32_3 %290 = OpLoad %119 
                               f32_3 %291 = OpVectorShuffle %290 %289 3 4 2 
                                              OpStore %119 %291 
                               f32_3 %292 = OpLoad %119 
                               f32_2 %293 = OpVectorShuffle %292 %292 0 1 
                                 f32 %294 = OpLoad %245 
                               f32_2 %295 = OpCompositeConstruct %294 %294 
                               f32_2 %296 = OpFMul %293 %295 
                               f32_2 %297 = OpLoad %150 
                               f32_2 %298 = OpFAdd %296 %297 
                               f32_3 %299 = OpLoad %119 
                               f32_3 %300 = OpVectorShuffle %299 %298 3 4 2 
                                              OpStore %119 %300 
                        Private f32* %301 = OpAccessChain %150 %34 
                                 f32 %302 = OpLoad %301 
                                 f32 %303 = OpExtInst %1 10 %302 
                                              OpStore %245 %303 
                                 f32 %304 = OpLoad %245 
                                bool %306 = OpFOrdGreaterThanEqual %304 %305 
                       Private bool* %307 = OpAccessChain %63 %188 
                                              OpStore %307 %306 
                               f32_3 %308 = OpLoad %119 
                               f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                               f32_2 %310 = OpExtInst %1 8 %309 
                               f32_3 %311 = OpLoad %55 
                               f32_3 %312 = OpVectorShuffle %311 %310 3 4 2 
                                              OpStore %55 %312 
                               f32_3 %313 = OpLoad %55 
                               f32_2 %314 = OpVectorShuffle %313 %313 0 1 
                                 f32 %318 = OpDot %314 %317 
                        Private f32* %319 = OpAccessChain %55 %21 
                                              OpStore %319 %318 
                        Private f32* %320 = OpAccessChain %55 %21 
                                 f32 %321 = OpLoad %320 
                                 f32 %322 = OpExtInst %1 13 %321 
                        Private f32* %323 = OpAccessChain %55 %21 
                                              OpStore %323 %322 
                        Private f32* %324 = OpAccessChain %55 %21 
                                 f32 %325 = OpLoad %324 
                                 f32 %327 = OpFMul %325 %326 
                        Private f32* %328 = OpAccessChain %55 %21 
                                              OpStore %328 %327 
                        Private f32* %329 = OpAccessChain %55 %21 
                                 f32 %330 = OpLoad %329 
                                 f32 %331 = OpExtInst %1 10 %330 
                        Private f32* %332 = OpAccessChain %55 %21 
                                              OpStore %332 %331 
                        Private f32* %333 = OpAccessChain %9 %21 
                                 f32 %334 = OpLoad %333 
                        Private f32* %335 = OpAccessChain %55 %21 
                                 f32 %336 = OpLoad %335 
                                 f32 %337 = OpFMul %334 %336 
                        Private f32* %338 = OpAccessChain %55 %34 
                                              OpStore %338 %337 
                               f32_3 %340 = OpLoad %119 
                               f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 1 
                               f32_4 %345 = OpFAdd %341 %344 
                                              OpStore %339 %345 
                        Private f32* %346 = OpAccessChain %119 %21 
                                 f32 %347 = OpLoad %346 
                                 f32 %348 = OpExtInst %1 10 %347 
                        Private f32* %349 = OpAccessChain %119 %21 
                                              OpStore %349 %348 
                        Private f32* %350 = OpAccessChain %119 %21 
                                 f32 %351 = OpLoad %350 
                                bool %352 = OpFOrdGreaterThanEqual %351 %305 
                       Private bool* %353 = OpAccessChain %63 %21 
                                              OpStore %353 %352 
                       Private bool* %354 = OpAccessChain %63 %21 
                                bool %355 = OpLoad %354 
                                 f32 %356 = OpSelect %355 %18 %198 
                        Private f32* %357 = OpAccessChain %119 %21 
                                              OpStore %357 %356 
                       Private bool* %358 = OpAccessChain %63 %188 
                                bool %359 = OpLoad %358 
                                 f32 %360 = OpSelect %359 %18 %198 
                        Private f32* %361 = OpAccessChain %119 %188 
                                              OpStore %361 %360 
                        Private f32* %362 = OpAccessChain %119 %188 
                                 f32 %363 = OpLoad %362 
                        Private f32* %364 = OpAccessChain %119 %21 
                                 f32 %365 = OpLoad %364 
                                 f32 %366 = OpFMul %363 %365 
                        Private f32* %367 = OpAccessChain %119 %21 
                                              OpStore %367 %366 
                               f32_4 %368 = OpLoad %339 
                               f32_4 %369 = OpExtInst %1 8 %368 
                                              OpStore %339 %369 
                               f32_4 %370 = OpLoad %339 
                               f32_2 %371 = OpVectorShuffle %370 %370 0 1 
                                 f32 %372 = OpDot %371 %317 
                        Private f32* %373 = OpAccessChain %104 %21 
                                              OpStore %373 %372 
                               f32_4 %374 = OpLoad %339 
                               f32_2 %375 = OpVectorShuffle %374 %374 2 3 
                                 f32 %376 = OpDot %375 %317 
                        Private f32* %377 = OpAccessChain %104 %34 
                                              OpStore %377 %376 
                               f32_2 %378 = OpLoad %104 
                               f32_2 %379 = OpExtInst %1 13 %378 
                                              OpStore %104 %379 
                               f32_2 %380 = OpLoad %104 
                               f32_2 %382 = OpFMul %380 %381 
                                              OpStore %104 %382 
                               f32_2 %383 = OpLoad %104 
                               f32_2 %384 = OpExtInst %1 10 %383 
                                              OpStore %104 %384 
                               f32_2 %385 = OpLoad %104 
                               f32_4 %386 = OpLoad %9 
                               f32_2 %387 = OpVectorShuffle %386 %386 0 0 
                               f32_2 %388 = OpFMul %385 %387 
                               f32_3 %389 = OpLoad %55 
                               f32_3 %390 = OpVectorShuffle %389 %388 3 1 4 
                                              OpStore %55 %390 
                               f32_3 %391 = OpLoad %55 
                               f32_3 %392 = OpLoad %55 
                               f32_3 %393 = OpFMul %391 %392 
                               f32_4 %394 = OpLoad %9 
                               f32_4 %395 = OpVectorShuffle %394 %393 4 1 5 6 
                                              OpStore %9 %395 
                               f32_4 %396 = OpLoad %9 
                               f32_3 %397 = OpVectorShuffle %396 %396 0 2 3 
                               f32_3 %400 = OpFMul %397 %399 
                               f32_4 %401 = OpLoad %9 
                               f32_4 %402 = OpVectorShuffle %401 %400 4 1 5 6 
                                              OpStore %9 %402 
                               f32_4 %403 = OpLoad %9 
                               f32_3 %404 = OpVectorShuffle %403 %403 0 2 3 
                               f32_3 %406 = OpExtInst %1 37 %404 %405 
                               f32_4 %407 = OpLoad %9 
                               f32_4 %408 = OpVectorShuffle %407 %406 4 1 5 6 
                                              OpStore %9 %408 
                               f32_4 %409 = OpLoad %9 
                               f32_3 %410 = OpVectorShuffle %409 %409 0 2 3 
                               f32_3 %413 = OpFMul %410 %412 
                               f32_3 %416 = OpFAdd %413 %415 
                                              OpStore %55 %416 
                               f32_4 %417 = OpLoad %9 
                               f32_3 %418 = OpVectorShuffle %417 %417 0 2 3 
                               f32_4 %419 = OpLoad %9 
                               f32_3 %420 = OpVectorShuffle %419 %419 0 2 3 
                               f32_3 %421 = OpFMul %418 %420 
                               f32_4 %422 = OpLoad %9 
                               f32_4 %423 = OpVectorShuffle %422 %421 4 1 5 6 
                                              OpStore %9 %423 
                               f32_4 %424 = OpLoad %9 
                               f32_3 %425 = OpVectorShuffle %424 %424 0 2 3 
                               f32_3 %426 = OpLoad %55 
                               f32_3 %427 = OpFMul %425 %426 
                               f32_4 %428 = OpLoad %9 
                               f32_4 %429 = OpVectorShuffle %428 %427 4 1 5 6 
                                              OpStore %9 %429 
                               f32_4 %430 = OpLoad %9 
                               f32_4 %431 = OpVectorShuffle %430 %430 0 0 2 3 
                              bool_4 %434 = OpFOrdGreaterThanEqual %431 %433 
                              bool_3 %435 = OpVectorShuffle %434 %434 0 2 3 
                              bool_4 %436 = OpLoad %182 
                              bool_4 %437 = OpVectorShuffle %436 %435 4 1 5 6 
                                              OpStore %182 %437 
                       Private bool* %438 = OpAccessChain %182 %21 
                                bool %439 = OpLoad %438 
                                 f32 %440 = OpSelect %439 %18 %198 
                        Private f32* %441 = OpAccessChain %9 %21 
                                              OpStore %441 %440 
                       Private bool* %442 = OpAccessChain %182 %188 
                                bool %443 = OpLoad %442 
                                 f32 %444 = OpSelect %443 %18 %198 
                        Private f32* %445 = OpAccessChain %9 %188 
                                              OpStore %445 %444 
                       Private bool* %447 = OpAccessChain %182 %446 
                                bool %448 = OpLoad %447 
                                 f32 %449 = OpSelect %448 %18 %198 
                        Private f32* %450 = OpAccessChain %9 %446 
                                              OpStore %450 %449 
                               f32_4 %453 = OpLoad %9 
                               f32_3 %454 = OpVectorShuffle %453 %453 0 2 3 
                               f32_3 %455 = OpLoad %119 
                               f32_3 %456 = OpVectorShuffle %455 %455 0 0 0 
                               f32_3 %457 = OpFMul %454 %456 
                               f32_3 %458 = OpLoad %154 
                               f32_3 %459 = OpFAdd %457 %458 
                               f32_4 %460 = OpLoad %452 
                               f32_4 %461 = OpVectorShuffle %460 %459 4 5 6 3 
                                              OpStore %452 %461 
                         Output f32* %463 = OpAccessChain %452 %446 
                                              OpStore %463 %18 
                                              OpReturn
                                              OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}