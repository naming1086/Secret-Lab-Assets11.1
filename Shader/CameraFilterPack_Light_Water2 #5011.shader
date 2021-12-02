//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Light_Water2" {
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
  GpuProgramID 55150
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
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat3;
float u_xlat4;
float u_xlat5;
float u_xlat7;
int u_xlati7;
float u_xlat10;
vec2 u_xlat11;
int u_xlati11;
bool u_xlatb11;
float u_xlat12;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10 = _TimeX * 1.29999995;
    u_xlat1.xy = vec2(u_xlat10) * vec2(_Value2, _Value3);
    u_xlat15 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16 = float(u_xlati_loop_1);
        u_xlat16 = u_xlat16 * 0.897597909;
        u_xlat2 = sin(u_xlat16);
        u_xlat3 = cos(u_xlat16);
        u_xlat16 = u_xlat10 * u_xlat3;
        u_xlat16 = u_xlat16 * _Value + u_xlat1.x;
        u_xlat16 = u_xlat0.x + u_xlat16;
        u_xlat7 = u_xlat10 * u_xlat2;
        u_xlat7 = u_xlat7 * _Value + (-u_xlat1.y);
        u_xlat7 = u_xlat0.y + (-u_xlat7);
        u_xlat2 = u_xlat2 * u_xlat7;
        u_xlat16 = u_xlat16 * u_xlat3 + (-u_xlat2);
        u_xlat16 = u_xlat16 * 6.0;
        u_xlat16 = cos(u_xlat16);
        u_xlat15 = u_xlat16 * _Value4 + u_xlat15;
    }
    u_xlat15 = cos(u_xlat15);
    u_xlat11.xy = u_xlat0.xy + vec2(8.52999973, 8.52999973);
    u_xlat2 = float(0.0);
    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
    {
        u_xlat12 = float(u_xlati_loop_2);
        u_xlat12 = u_xlat12 * 0.897597909;
        u_xlat3 = sin(u_xlat12);
        u_xlat4 = cos(u_xlat12);
        u_xlat12 = u_xlat10 * u_xlat4;
        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
        u_xlat12 = u_xlat11.x + u_xlat12;
        u_xlat17 = u_xlat10 * u_xlat3;
        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
        u_xlat17 = u_xlat0.y + (-u_xlat17);
        u_xlat17 = u_xlat3 * u_xlat17;
        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
        u_xlat12 = u_xlat12 * 6.0;
        u_xlat12 = cos(u_xlat12);
        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
    }
    u_xlat11.x = cos(u_xlat2);
    u_xlat11.x = u_xlat15 + (-u_xlat11.x);
    u_xlat2 = float(0.0);
    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
    {
        u_xlat12 = float(u_xlati_loop_3);
        u_xlat12 = u_xlat12 * 0.897597909;
        u_xlat3 = sin(u_xlat12);
        u_xlat4 = cos(u_xlat12);
        u_xlat12 = u_xlat10 * u_xlat4;
        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
        u_xlat12 = u_xlat0.x + u_xlat12;
        u_xlat17 = u_xlat10 * u_xlat3;
        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
        u_xlat17 = u_xlat11.y + (-u_xlat17);
        u_xlat17 = u_xlat3 * u_xlat17;
        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
        u_xlat12 = u_xlat12 * 6.0;
        u_xlat12 = cos(u_xlat12);
        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
    }
    u_xlat10 = cos(u_xlat2);
    u_xlat10 = (-u_xlat10) + u_xlat15;
    u_xlat15 = u_xlat11.x * 0.00833333377;
    u_xlat1.x = u_xlat11.x * 0.0166666675 + u_xlat0.x;
    u_xlat0.x = u_xlat10 * 0.00833333377;
    u_xlat1.y = u_xlat10 * 0.0166666675 + u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat0.x * 700.0 + 1.0;
    u_xlat5 = u_xlat11.x * 0.00833333377 + -0.0120000001;
    u_xlat10 = u_xlat10 * 0.00833333377 + -0.0120000001;
    u_xlatb15 = 0.0<u_xlat5;
    u_xlatb11 = 0.0<u_xlat10;
    u_xlatb15 = u_xlatb15 && u_xlatb11;
    u_xlat5 = u_xlat10 * u_xlat5;
    u_xlat5 = u_xlat5 * 200000.0;
    u_xlat10 = log2(u_xlat0.x);
    u_xlat5 = u_xlat10 * u_xlat5;
    u_xlat5 = exp2(u_xlat5);
    u_xlat0.x = (u_xlatb15) ? u_xlat5 : u_xlat0.x;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
; Bound: 394
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %383 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %371 DescriptorSet 371 
                                                      OpDecorate %371 Binding 371 
                                                      OpDecorate %375 DescriptorSet 375 
                                                      OpDecorate %375 Binding 375 
                                                      OpDecorate %383 Location 383 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %13 = OpTypeVector %6 4 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %13 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 5 
                                              %19 = OpTypePointer Uniform %13 
                                              %28 = OpTypePointer Private %6 
                                 Private f32* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Uniform %6 
                                          f32 %34 = OpConstant 3.674022E-40 
                                              %36 = OpTypePointer Private %13 
                               Private f32_4* %37 = OpVariable Private 
                                          i32 %40 = OpConstant 2 
                                          i32 %43 = OpConstant 3 
                                 Private f32* %50 = OpVariable Private 
                                          f32 %51 = OpConstant 3.674022E-40 
                                              %52 = OpTypePointer Function %17 
                                          i32 %60 = OpConstant 8 
                                              %61 = OpTypeBool 
                                 Private f32* %63 = OpVariable Private 
                                          f32 %67 = OpConstant 3.674022E-40 
                                 Private f32* %69 = OpVariable Private 
                                 Private f32* %72 = OpVariable Private 
                                          i32 %79 = OpConstant 1 
                                              %83 = OpTypeInt 32 0 
                                          u32 %84 = OpConstant 0 
                                 Private f32* %92 = OpVariable Private 
                                         u32 %100 = OpConstant 1 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         i32 %125 = OpConstant 4 
                              Private f32_2* %135 = OpVariable Private 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                Private f32* %148 = OpVariable Private 
                                Private f32* %155 = OpVariable Private 
                                Private f32* %172 = OpVariable Private 
                                         f32 %294 = OpConstant 3.674022E-40 
                                         f32 %298 = OpConstant 3.674022E-40 
                                         f32 %320 = OpConstant 3.674022E-40 
                                         f32 %322 = OpConstant 3.674022E-40 
                                Private f32* %325 = OpVariable Private 
                                         f32 %329 = OpConstant 3.674022E-40 
                                             %334 = OpTypePointer Private %61 
                               Private bool* %335 = OpVariable Private 
                               Private bool* %338 = OpVariable Private 
                                         f32 %348 = OpConstant 3.674022E-40 
                                             %359 = OpTypePointer Function %6 
                                             %369 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %370 = OpTypePointer UniformConstant %369 
        UniformConstant read_only Texture2D* %371 = OpVariable UniformConstant 
                                             %373 = OpTypeSampler 
                                             %374 = OpTypePointer UniformConstant %373 
                    UniformConstant sampler* %375 = OpVariable UniformConstant 
                                             %377 = OpTypeSampledImage %369 
                                             %382 = OpTypePointer Output %13 
                               Output f32_4* %383 = OpVariable Output 
                                             %389 = OpTypePointer Private %17 
                                Private i32* %390 = OpVariable Private 
                                Private i32* %391 = OpVariable Private 
                               Private bool* %392 = OpVariable Private 
                               Private bool* %393 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %53 = OpVariable Function 
                               Function i32* %140 = OpVariable Function 
                               Function i32* %219 = OpVariable Function 
                               Function f32* %360 = OpVariable Function 
                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %20 = OpAccessChain %16 %18 
                                        f32_4 %21 = OpLoad %20 
                                        f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                        f32_2 %23 = OpFMul %12 %22 
                               Uniform f32_4* %24 = OpAccessChain %16 %18 
                                        f32_4 %25 = OpLoad %24 
                                        f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                        f32_2 %27 = OpFAdd %23 %26 
                                                      OpStore %9 %27 
                                 Uniform f32* %32 = OpAccessChain %16 %30 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                                      OpStore %29 %35 
                                          f32 %38 = OpLoad %29 
                                        f32_2 %39 = OpCompositeConstruct %38 %38 
                                 Uniform f32* %41 = OpAccessChain %16 %40 
                                          f32 %42 = OpLoad %41 
                                 Uniform f32* %44 = OpAccessChain %16 %43 
                                          f32 %45 = OpLoad %44 
                                        f32_2 %46 = OpCompositeConstruct %42 %45 
                                        f32_2 %47 = OpFMul %39 %46 
                                        f32_4 %48 = OpLoad %37 
                                        f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                      OpStore %37 %49 
                                                      OpStore %50 %51 
                                                      OpStore %53 %30 
                                                      OpBranch %54 
                                              %54 = OpLabel 
                                                      OpLoopMerge %56 %57 None 
                                                      OpBranch %58 
                                              %58 = OpLabel 
                                          i32 %59 = OpLoad %53 
                                         bool %62 = OpSLessThan %59 %60 
                                                      OpBranchConditional %62 %55 %56 
                                              %55 = OpLabel 
                                          i32 %64 = OpLoad %53 
                                          f32 %65 = OpConvertSToF %64 
                                                      OpStore %63 %65 
                                          f32 %66 = OpLoad %63 
                                          f32 %68 = OpFMul %66 %67 
                                                      OpStore %63 %68 
                                          f32 %70 = OpLoad %63 
                                          f32 %71 = OpExtInst %1 13 %70 
                                                      OpStore %69 %71 
                                          f32 %73 = OpLoad %63 
                                          f32 %74 = OpExtInst %1 14 %73 
                                                      OpStore %72 %74 
                                          f32 %75 = OpLoad %29 
                                          f32 %76 = OpLoad %72 
                                          f32 %77 = OpFMul %75 %76 
                                                      OpStore %63 %77 
                                          f32 %78 = OpLoad %63 
                                 Uniform f32* %80 = OpAccessChain %16 %79 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFMul %78 %81 
                                 Private f32* %85 = OpAccessChain %37 %84 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFAdd %82 %86 
                                                      OpStore %63 %87 
                                 Private f32* %88 = OpAccessChain %9 %84 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpLoad %63 
                                          f32 %91 = OpFAdd %89 %90 
                                                      OpStore %63 %91 
                                          f32 %93 = OpLoad %29 
                                          f32 %94 = OpLoad %69 
                                          f32 %95 = OpFMul %93 %94 
                                                      OpStore %92 %95 
                                          f32 %96 = OpLoad %92 
                                 Uniform f32* %97 = OpAccessChain %16 %79 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFMul %96 %98 
                                Private f32* %101 = OpAccessChain %37 %100 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFNegate %102 
                                         f32 %104 = OpFAdd %99 %103 
                                                      OpStore %92 %104 
                                Private f32* %105 = OpAccessChain %9 %100 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpLoad %92 
                                         f32 %108 = OpFNegate %107 
                                         f32 %109 = OpFAdd %106 %108 
                                                      OpStore %92 %109 
                                         f32 %110 = OpLoad %69 
                                         f32 %111 = OpLoad %92 
                                         f32 %112 = OpFMul %110 %111 
                                                      OpStore %69 %112 
                                         f32 %113 = OpLoad %63 
                                         f32 %114 = OpLoad %72 
                                         f32 %115 = OpFMul %113 %114 
                                         f32 %116 = OpLoad %69 
                                         f32 %117 = OpFNegate %116 
                                         f32 %118 = OpFAdd %115 %117 
                                                      OpStore %63 %118 
                                         f32 %119 = OpLoad %63 
                                         f32 %121 = OpFMul %119 %120 
                                                      OpStore %63 %121 
                                         f32 %122 = OpLoad %63 
                                         f32 %123 = OpExtInst %1 14 %122 
                                                      OpStore %63 %123 
                                         f32 %124 = OpLoad %63 
                                Uniform f32* %126 = OpAccessChain %16 %125 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFMul %124 %127 
                                         f32 %129 = OpLoad %50 
                                         f32 %130 = OpFAdd %128 %129 
                                                      OpStore %50 %130 
                                                      OpBranch %57 
                                              %57 = OpLabel 
                                         i32 %131 = OpLoad %53 
                                         i32 %132 = OpIAdd %131 %79 
                                                      OpStore %53 %132 
                                                      OpBranch %54 
                                              %56 = OpLabel 
                                         f32 %133 = OpLoad %50 
                                         f32 %134 = OpExtInst %1 14 %133 
                                                      OpStore %50 %134 
                                       f32_2 %136 = OpLoad %9 
                                       f32_2 %139 = OpFAdd %136 %138 
                                                      OpStore %135 %139 
                                                      OpStore %69 %51 
                                                      OpStore %140 %30 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                                      OpLoopMerge %143 %144 None 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                         i32 %146 = OpLoad %140 
                                        bool %147 = OpSLessThan %146 %60 
                                                      OpBranchConditional %147 %142 %143 
                                             %142 = OpLabel 
                                         i32 %149 = OpLoad %140 
                                         f32 %150 = OpConvertSToF %149 
                                                      OpStore %148 %150 
                                         f32 %151 = OpLoad %148 
                                         f32 %152 = OpFMul %151 %67 
                                                      OpStore %148 %152 
                                         f32 %153 = OpLoad %148 
                                         f32 %154 = OpExtInst %1 13 %153 
                                                      OpStore %72 %154 
                                         f32 %156 = OpLoad %148 
                                         f32 %157 = OpExtInst %1 14 %156 
                                                      OpStore %155 %157 
                                         f32 %158 = OpLoad %29 
                                         f32 %159 = OpLoad %155 
                                         f32 %160 = OpFMul %158 %159 
                                                      OpStore %148 %160 
                                         f32 %161 = OpLoad %148 
                                Uniform f32* %162 = OpAccessChain %16 %79 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Private f32* %165 = OpAccessChain %37 %84 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFAdd %164 %166 
                                                      OpStore %148 %167 
                                Private f32* %168 = OpAccessChain %135 %84 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpLoad %148 
                                         f32 %171 = OpFAdd %169 %170 
                                                      OpStore %148 %171 
                                         f32 %173 = OpLoad %29 
                                         f32 %174 = OpLoad %72 
                                         f32 %175 = OpFMul %173 %174 
                                                      OpStore %172 %175 
                                         f32 %176 = OpLoad %172 
                                Uniform f32* %177 = OpAccessChain %16 %79 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %176 %178 
                                Private f32* %180 = OpAccessChain %37 %100 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFNegate %181 
                                         f32 %183 = OpFAdd %179 %182 
                                                      OpStore %172 %183 
                                Private f32* %184 = OpAccessChain %9 %100 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpLoad %172 
                                         f32 %187 = OpFNegate %186 
                                         f32 %188 = OpFAdd %185 %187 
                                                      OpStore %172 %188 
                                         f32 %189 = OpLoad %72 
                                         f32 %190 = OpLoad %172 
                                         f32 %191 = OpFMul %189 %190 
                                                      OpStore %172 %191 
                                         f32 %192 = OpLoad %148 
                                         f32 %193 = OpLoad %155 
                                         f32 %194 = OpFMul %192 %193 
                                         f32 %195 = OpLoad %172 
                                         f32 %196 = OpFNegate %195 
                                         f32 %197 = OpFAdd %194 %196 
                                                      OpStore %148 %197 
                                         f32 %198 = OpLoad %148 
                                         f32 %199 = OpFMul %198 %120 
                                                      OpStore %148 %199 
                                         f32 %200 = OpLoad %148 
                                         f32 %201 = OpExtInst %1 14 %200 
                                                      OpStore %148 %201 
                                         f32 %202 = OpLoad %148 
                                Uniform f32* %203 = OpAccessChain %16 %125 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFMul %202 %204 
                                         f32 %206 = OpLoad %69 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %69 %207 
                                                      OpBranch %144 
                                             %144 = OpLabel 
                                         i32 %208 = OpLoad %140 
                                         i32 %209 = OpIAdd %208 %79 
                                                      OpStore %140 %209 
                                                      OpBranch %141 
                                             %143 = OpLabel 
                                         f32 %210 = OpLoad %69 
                                         f32 %211 = OpExtInst %1 14 %210 
                                Private f32* %212 = OpAccessChain %135 %84 
                                                      OpStore %212 %211 
                                         f32 %213 = OpLoad %50 
                                Private f32* %214 = OpAccessChain %135 %84 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %135 %84 
                                                      OpStore %218 %217 
                                                      OpStore %69 %51 
                                                      OpStore %219 %30 
                                                      OpBranch %220 
                                             %220 = OpLabel 
                                                      OpLoopMerge %222 %223 None 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                         i32 %225 = OpLoad %219 
                                        bool %226 = OpSLessThan %225 %60 
                                                      OpBranchConditional %226 %221 %222 
                                             %221 = OpLabel 
                                         i32 %227 = OpLoad %219 
                                         f32 %228 = OpConvertSToF %227 
                                                      OpStore %148 %228 
                                         f32 %229 = OpLoad %148 
                                         f32 %230 = OpFMul %229 %67 
                                                      OpStore %148 %230 
                                         f32 %231 = OpLoad %148 
                                         f32 %232 = OpExtInst %1 13 %231 
                                                      OpStore %72 %232 
                                         f32 %233 = OpLoad %148 
                                         f32 %234 = OpExtInst %1 14 %233 
                                                      OpStore %155 %234 
                                         f32 %235 = OpLoad %29 
                                         f32 %236 = OpLoad %155 
                                         f32 %237 = OpFMul %235 %236 
                                                      OpStore %148 %237 
                                         f32 %238 = OpLoad %148 
                                Uniform f32* %239 = OpAccessChain %16 %79 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFMul %238 %240 
                                Private f32* %242 = OpAccessChain %37 %84 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFAdd %241 %243 
                                                      OpStore %148 %244 
                                Private f32* %245 = OpAccessChain %9 %84 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpLoad %148 
                                         f32 %248 = OpFAdd %246 %247 
                                                      OpStore %148 %248 
                                         f32 %249 = OpLoad %29 
                                         f32 %250 = OpLoad %72 
                                         f32 %251 = OpFMul %249 %250 
                                                      OpStore %172 %251 
                                         f32 %252 = OpLoad %172 
                                Uniform f32* %253 = OpAccessChain %16 %79 
                                         f32 %254 = OpLoad %253 
                                         f32 %255 = OpFMul %252 %254 
                                Private f32* %256 = OpAccessChain %37 %100 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFNegate %257 
                                         f32 %259 = OpFAdd %255 %258 
                                                      OpStore %172 %259 
                                Private f32* %260 = OpAccessChain %135 %100 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpLoad %172 
                                         f32 %263 = OpFNegate %262 
                                         f32 %264 = OpFAdd %261 %263 
                                                      OpStore %172 %264 
                                         f32 %265 = OpLoad %72 
                                         f32 %266 = OpLoad %172 
                                         f32 %267 = OpFMul %265 %266 
                                                      OpStore %172 %267 
                                         f32 %268 = OpLoad %148 
                                         f32 %269 = OpLoad %155 
                                         f32 %270 = OpFMul %268 %269 
                                         f32 %271 = OpLoad %172 
                                         f32 %272 = OpFNegate %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %148 %273 
                                         f32 %274 = OpLoad %148 
                                         f32 %275 = OpFMul %274 %120 
                                                      OpStore %148 %275 
                                         f32 %276 = OpLoad %148 
                                         f32 %277 = OpExtInst %1 14 %276 
                                                      OpStore %148 %277 
                                         f32 %278 = OpLoad %148 
                                Uniform f32* %279 = OpAccessChain %16 %125 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFMul %278 %280 
                                         f32 %282 = OpLoad %69 
                                         f32 %283 = OpFAdd %281 %282 
                                                      OpStore %69 %283 
                                                      OpBranch %223 
                                             %223 = OpLabel 
                                         i32 %284 = OpLoad %219 
                                         i32 %285 = OpIAdd %284 %79 
                                                      OpStore %219 %285 
                                                      OpBranch %220 
                                             %222 = OpLabel 
                                         f32 %286 = OpLoad %69 
                                         f32 %287 = OpExtInst %1 14 %286 
                                                      OpStore %29 %287 
                                         f32 %288 = OpLoad %29 
                                         f32 %289 = OpFNegate %288 
                                         f32 %290 = OpLoad %50 
                                         f32 %291 = OpFAdd %289 %290 
                                                      OpStore %29 %291 
                                Private f32* %292 = OpAccessChain %135 %84 
                                         f32 %293 = OpLoad %292 
                                         f32 %295 = OpFMul %293 %294 
                                                      OpStore %50 %295 
                                Private f32* %296 = OpAccessChain %135 %84 
                                         f32 %297 = OpLoad %296 
                                         f32 %299 = OpFMul %297 %298 
                                Private f32* %300 = OpAccessChain %9 %84 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFAdd %299 %301 
                                Private f32* %303 = OpAccessChain %37 %84 
                                                      OpStore %303 %302 
                                         f32 %304 = OpLoad %29 
                                         f32 %305 = OpFMul %304 %294 
                                Private f32* %306 = OpAccessChain %9 %84 
                                                      OpStore %306 %305 
                                         f32 %307 = OpLoad %29 
                                         f32 %308 = OpFMul %307 %298 
                                Private f32* %309 = OpAccessChain %9 %100 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFAdd %308 %310 
                                Private f32* %312 = OpAccessChain %37 %100 
                                                      OpStore %312 %311 
                                Private f32* %313 = OpAccessChain %9 %84 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpLoad %50 
                                         f32 %316 = OpFMul %314 %315 
                                Private f32* %317 = OpAccessChain %9 %84 
                                                      OpStore %317 %316 
                                Private f32* %318 = OpAccessChain %9 %84 
                                         f32 %319 = OpLoad %318 
                                         f32 %321 = OpFMul %319 %320 
                                         f32 %323 = OpFAdd %321 %322 
                                Private f32* %324 = OpAccessChain %9 %84 
                                                      OpStore %324 %323 
                                Private f32* %326 = OpAccessChain %135 %84 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFMul %327 %294 
                                         f32 %330 = OpFAdd %328 %329 
                                                      OpStore %325 %330 
                                         f32 %331 = OpLoad %29 
                                         f32 %332 = OpFMul %331 %294 
                                         f32 %333 = OpFAdd %332 %329 
                                                      OpStore %29 %333 
                                         f32 %336 = OpLoad %325 
                                        bool %337 = OpFOrdLessThan %51 %336 
                                                      OpStore %335 %337 
                                         f32 %339 = OpLoad %29 
                                        bool %340 = OpFOrdLessThan %51 %339 
                                                      OpStore %338 %340 
                                        bool %341 = OpLoad %335 
                                        bool %342 = OpLoad %338 
                                        bool %343 = OpLogicalAnd %341 %342 
                                                      OpStore %335 %343 
                                         f32 %344 = OpLoad %29 
                                         f32 %345 = OpLoad %325 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %325 %346 
                                         f32 %347 = OpLoad %325 
                                         f32 %349 = OpFMul %347 %348 
                                                      OpStore %325 %349 
                                Private f32* %350 = OpAccessChain %9 %84 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 30 %351 
                                                      OpStore %29 %352 
                                         f32 %353 = OpLoad %29 
                                         f32 %354 = OpLoad %325 
                                         f32 %355 = OpFMul %353 %354 
                                                      OpStore %325 %355 
                                         f32 %356 = OpLoad %325 
                                         f32 %357 = OpExtInst %1 29 %356 
                                                      OpStore %325 %357 
                                        bool %358 = OpLoad %335 
                                                      OpSelectionMerge %362 None 
                                                      OpBranchConditional %358 %361 %364 
                                             %361 = OpLabel 
                                         f32 %363 = OpLoad %325 
                                                      OpStore %360 %363 
                                                      OpBranch %362 
                                             %364 = OpLabel 
                                Private f32* %365 = OpAccessChain %9 %84 
                                         f32 %366 = OpLoad %365 
                                                      OpStore %360 %366 
                                                      OpBranch %362 
                                             %362 = OpLabel 
                                         f32 %367 = OpLoad %360 
                                Private f32* %368 = OpAccessChain %9 %84 
                                                      OpStore %368 %367 
                         read_only Texture2D %372 = OpLoad %371 
                                     sampler %376 = OpLoad %375 
                  read_only Texture2DSampled %378 = OpSampledImage %372 %376 
                                       f32_4 %379 = OpLoad %37 
                                       f32_2 %380 = OpVectorShuffle %379 %379 0 1 
                                       f32_4 %381 = OpImageSampleImplicitLod %378 %380 
                                                      OpStore %37 %381 
                                       f32_2 %384 = OpLoad %9 
                                       f32_4 %385 = OpVectorShuffle %384 %384 0 0 0 0 
                                       f32_4 %386 = OpLoad %37 
                                       f32_4 %387 = OpFMul %385 %386 
                                                      OpStore %383 %387 
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