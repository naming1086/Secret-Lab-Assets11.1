//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Aura" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value2 ("_ColorRGB", Color) = (1,1,1,1)
_Value5 ("Speed", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 761
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
uniform 	vec4 _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
int u_xlati2;
bool u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
vec2 u_xlat15;
float u_xlat16;
bool u_xlatb16;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + (-vec2(_Value3, _Value4));
    u_xlat1.x = _TimeX * _Value5;
    u_xlat7 = min(abs(u_xlat12.x), abs(u_xlat12.y));
    u_xlat13 = max(abs(u_xlat12.x), abs(u_xlat12.y));
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat7 = u_xlat13 * u_xlat7;
    u_xlat13 = u_xlat7 * u_xlat7;
    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
    u_xlat19 = u_xlat13 * u_xlat7;
    u_xlatb2 = abs(u_xlat12.x)<abs(u_xlat12.y);
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
    u_xlat19 = u_xlatb2 ? u_xlat19 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
    u_xlatb13 = u_xlat12.x<(-u_xlat12.x);
    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
    u_xlat7 = u_xlat13 + u_xlat7;
    u_xlat13 = min(u_xlat12.x, u_xlat12.y);
    u_xlat19 = max(u_xlat12.x, u_xlat12.y);
    u_xlatb13 = u_xlat13<(-u_xlat13);
    u_xlatb19 = u_xlat19>=(-u_xlat19);
    u_xlatb13 = u_xlatb19 && u_xlatb13;
    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
    u_xlat13 = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat13 = sqrt(u_xlat13);
    u_xlat19 = u_xlat13 * _Value;
    u_xlat19 = u_xlat19 * 40.0 + -3.0;
    u_xlat2 = u_xlat7 * 6.0;
    u_xlat2 = cos(u_xlat2);
    u_xlat2 = u_xlat7 + u_xlat2;
    u_xlat2 = u_xlat1.x * 2.0 + u_xlat2;
    u_xlat2 = cos(u_xlat2);
    u_xlat19 = u_xlat2 * 0.680000007 + u_xlat19;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat7 = (-u_xlat13) * _Value + u_xlat7;
    u_xlat13 = 0.0;
    for(int u_xlati_loop_1 = 3 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
    {
        u_xlat8.x = float(u_xlati_loop_1);
        u_xlat14.x = u_xlat7 * u_xlat8.x + u_xlat1.x;
        u_xlat14.xy = u_xlat12.xy + u_xlat14.xx;
        u_xlat8.xy = u_xlat8.xx + u_xlat14.xy;
        u_xlat8.xy = cos(u_xlat8.xy);
        u_xlat8.xy = u_xlat8.xy * vec2(0.200000003, 0.200000003) + u_xlat12.xy;
        u_xlat3.xy = abs(u_xlat8.xy) * vec2(10.0, 10.0);
        u_xlat15.xy = fract(u_xlat3.xy);
        u_xlat15.xy = u_xlat15.xy + vec2(-0.5, -0.5);
        u_xlat3.xy = floor(u_xlat3.xy);
        u_xlat20 = 1.0;
        u_xlat4.x = -1.0;
        while(true){
            u_xlatb16 = u_xlat4.x>=2.0;
            if(u_xlatb16){break;}
            u_xlat16 = u_xlat20;
            u_xlat4.y = -1.0;
            while(true){
                u_xlatb22 = u_xlat4.y>=2.0;
                if(u_xlatb22){break;}
                u_xlat5.xy = u_xlat3.xy + u_xlat4.xy;
                u_xlat5.xy = u_xlat5.xy + vec2(_TimeX);
                u_xlat5.xy = cos(u_xlat5.xy);
                u_xlat22 = u_xlat5.y + u_xlat5.x;
                u_xlat5.xy = vec2(u_xlat22) * vec2(0.300000012, 0.300000012) + u_xlat15.xy;
                u_xlat5.xy = (-u_xlat4.xy) + u_xlat5.xy;
                u_xlat22 = dot(u_xlat5.xy, u_xlat5.xy);
                u_xlat22 = sqrt(u_xlat22);
                u_xlat16 = min(u_xlat22, u_xlat16);
                u_xlat4.y = u_xlat4.y + 1.0;
            }
            u_xlat20 = u_xlat16;
            u_xlat4.x = u_xlat4.x + 1.0;
        }
        u_xlat8.xy = u_xlat8.xy * vec2(14.2340002, 16.2339993);
        u_xlat8.xy = cos(u_xlat8.xy);
        u_xlat8.x = u_xlat8.y + u_xlat8.x;
        u_xlat8.x = u_xlat8.x * 0.400000006 + 0.699999988;
        u_xlat13 = u_xlat20 * u_xlat8.x + u_xlat13;
    }
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.xyz = vec3(u_xlat13) * _Value2.xyz;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz * _Value2.www + u_xlat0.xyz;
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
; Bound: 425
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %408 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %384 DescriptorSet 384 
                                                      OpDecorate %384 Binding 384 
                                                      OpDecorate %388 DescriptorSet 388 
                                                      OpDecorate %388 Binding 388 
                                                      OpDecorate %408 Location 408 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %14 = OpTypeVector %6 4 
                                              %15 = OpTypeStruct %6 %6 %14 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32_4; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 6 
                                              %20 = OpTypePointer Uniform %14 
                                              %31 = OpTypePointer Private %10 
                               Private f32_2* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                              %36 = OpTypePointer Uniform %6 
                                          i32 %39 = OpConstant 4 
                               Private f32_3* %45 = OpVariable Private 
                                          i32 %46 = OpConstant 0 
                                          i32 %49 = OpConstant 5 
                                              %53 = OpTypeInt 32 0 
                                          u32 %54 = OpConstant 0 
                                              %55 = OpTypePointer Private %6 
                                 Private f32* %57 = OpVariable Private 
                                          u32 %61 = OpConstant 1 
                                 Private f32* %66 = OpVariable Private 
                                          f32 %74 = OpConstant 3.674022E-40 
                                 Private f32* %83 = OpVariable Private 
                                          f32 %85 = OpConstant 3.674022E-40 
                                          f32 %87 = OpConstant 3.674022E-40 
                                          f32 %92 = OpConstant 3.674022E-40 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         f32 %102 = OpConstant 3.674022E-40 
                                             %107 = OpTypeBool 
                                             %108 = OpTypePointer Private %107 
                               Private bool* %109 = OpVariable Private 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                               Private bool* %131 = OpVariable Private 
                                         f32 %139 = OpConstant 3.674022E-40 
                               Private bool* %158 = OpVariable Private 
                                             %167 = OpTypePointer Function %6 
                                         i32 %182 = OpConstant 1 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %189 = OpConstant 3.674022E-40 
                                Private f32* %191 = OpVariable Private 
                                         f32 %193 = OpConstant 3.674022E-40 
                                         f32 %202 = OpConstant 3.674022E-40 
                                         f32 %209 = OpConstant 3.674022E-40 
                                             %222 = OpTypePointer Function %18 
                              Private f32_2* %231 = OpVariable Private 
                              Private f32_2* %235 = OpVariable Private 
                                         f32 %255 = OpConstant 3.674022E-40 
                                       f32_2 %256 = OpConstantComposite %255 %255 
                              Private f32_2* %260 = OpVariable Private 
                                         f32 %263 = OpConstant 3.674022E-40 
                                       f32_2 %264 = OpConstantComposite %263 %263 
                              Private f32_2* %266 = OpVariable Private 
                                         f32 %270 = OpConstant 3.674022E-40 
                                       f32_2 %271 = OpConstantComposite %270 %270 
                                Private f32* %275 = OpVariable Private 
                              Private f32_2* %276 = OpVariable Private 
                                         f32 %277 = OpConstant 3.674022E-40 
                                        bool %284 = OpConstantTrue 
                               Private bool* %285 = OpVariable Private 
                                Private f32* %293 = OpVariable Private 
                               Private bool* %301 = OpVariable Private 
                              Private f32_2* %309 = OpVariable Private 
                                Private f32* %320 = OpVariable Private 
                                         f32 %328 = OpConstant 3.674022E-40 
                                       f32_2 %329 = OpConstantComposite %328 %328 
                                         f32 %355 = OpConstant 3.674022E-40 
                                         f32 %356 = OpConstant 3.674022E-40 
                                       f32_2 %357 = OpConstantComposite %355 %356 
                                         f32 %369 = OpConstant 3.674022E-40 
                                         f32 %371 = OpConstant 3.674022E-40 
                                             %382 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %383 = OpTypePointer UniformConstant %382 
        UniformConstant read_only Texture2D* %384 = OpVariable UniformConstant 
                                             %386 = OpTypeSampler 
                                             %387 = OpTypePointer UniformConstant %386 
                    UniformConstant sampler* %388 = OpVariable UniformConstant 
                                             %390 = OpTypeSampledImage %382 
                                         i32 %398 = OpConstant 2 
                                             %407 = OpTypePointer Output %14 
                               Output f32_4* %408 = OpVariable Output 
                                         u32 %418 = OpConstant 3 
                                             %419 = OpTypePointer Output %6 
                                             %422 = OpTypePointer Private %18 
                                Private i32* %423 = OpVariable Private 
                               Private bool* %424 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %168 = OpVariable Function 
                               Function i32* %223 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %21 = OpAccessChain %17 %19 
                                        f32_4 %22 = OpLoad %21 
                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                        f32_2 %24 = OpFMul %13 %23 
                               Uniform f32_4* %25 = OpAccessChain %17 %19 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                        f32_2 %28 = OpFAdd %24 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                 Uniform f32* %37 = OpAccessChain %17 %35 
                                          f32 %38 = OpLoad %37 
                                 Uniform f32* %40 = OpAccessChain %17 %39 
                                          f32 %41 = OpLoad %40 
                                        f32_2 %42 = OpCompositeConstruct %38 %41 
                                        f32_2 %43 = OpFNegate %42 
                                        f32_2 %44 = OpFAdd %34 %43 
                                                      OpStore %32 %44 
                                 Uniform f32* %47 = OpAccessChain %17 %46 
                                          f32 %48 = OpLoad %47 
                                 Uniform f32* %50 = OpAccessChain %17 %49 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFMul %48 %51 
                                 Private f32* %56 = OpAccessChain %45 %54 
                                                      OpStore %56 %52 
                                 Private f32* %58 = OpAccessChain %32 %54 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpExtInst %1 4 %59 
                                 Private f32* %62 = OpAccessChain %32 %61 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpExtInst %1 4 %63 
                                          f32 %65 = OpExtInst %1 37 %60 %64 
                                                      OpStore %57 %65 
                                 Private f32* %67 = OpAccessChain %32 %54 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpExtInst %1 4 %68 
                                 Private f32* %70 = OpAccessChain %32 %61 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpExtInst %1 4 %71 
                                          f32 %73 = OpExtInst %1 40 %69 %72 
                                                      OpStore %66 %73 
                                          f32 %75 = OpLoad %66 
                                          f32 %76 = OpFDiv %74 %75 
                                                      OpStore %66 %76 
                                          f32 %77 = OpLoad %66 
                                          f32 %78 = OpLoad %57 
                                          f32 %79 = OpFMul %77 %78 
                                                      OpStore %57 %79 
                                          f32 %80 = OpLoad %57 
                                          f32 %81 = OpLoad %57 
                                          f32 %82 = OpFMul %80 %81 
                                                      OpStore %66 %82 
                                          f32 %84 = OpLoad %66 
                                          f32 %86 = OpFMul %84 %85 
                                          f32 %88 = OpFAdd %86 %87 
                                                      OpStore %83 %88 
                                          f32 %89 = OpLoad %66 
                                          f32 %90 = OpLoad %83 
                                          f32 %91 = OpFMul %89 %90 
                                          f32 %93 = OpFAdd %91 %92 
                                                      OpStore %83 %93 
                                          f32 %94 = OpLoad %66 
                                          f32 %95 = OpLoad %83 
                                          f32 %96 = OpFMul %94 %95 
                                          f32 %98 = OpFAdd %96 %97 
                                                      OpStore %83 %98 
                                          f32 %99 = OpLoad %66 
                                         f32 %100 = OpLoad %83 
                                         f32 %101 = OpFMul %99 %100 
                                         f32 %103 = OpFAdd %101 %102 
                                                      OpStore %66 %103 
                                         f32 %104 = OpLoad %66 
                                         f32 %105 = OpLoad %57 
                                         f32 %106 = OpFMul %104 %105 
                                                      OpStore %83 %106 
                                Private f32* %110 = OpAccessChain %32 %54 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpExtInst %1 4 %111 
                                Private f32* %113 = OpAccessChain %32 %61 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpExtInst %1 4 %114 
                                        bool %116 = OpFOrdLessThan %112 %115 
                                                      OpStore %109 %116 
                                         f32 %117 = OpLoad %83 
                                         f32 %119 = OpFMul %117 %118 
                                         f32 %121 = OpFAdd %119 %120 
                                                      OpStore %83 %121 
                                        bool %122 = OpLoad %109 
                                         f32 %123 = OpLoad %83 
                                         f32 %125 = OpSelect %122 %123 %124 
                                                      OpStore %83 %125 
                                         f32 %126 = OpLoad %57 
                                         f32 %127 = OpLoad %66 
                                         f32 %128 = OpFMul %126 %127 
                                         f32 %129 = OpLoad %83 
                                         f32 %130 = OpFAdd %128 %129 
                                                      OpStore %57 %130 
                                Private f32* %132 = OpAccessChain %32 %54 
                                         f32 %133 = OpLoad %132 
                                Private f32* %134 = OpAccessChain %32 %54 
                                         f32 %135 = OpLoad %134 
                                         f32 %136 = OpFNegate %135 
                                        bool %137 = OpFOrdLessThan %133 %136 
                                                      OpStore %131 %137 
                                        bool %138 = OpLoad %131 
                                         f32 %140 = OpSelect %138 %139 %124 
                                                      OpStore %66 %140 
                                         f32 %141 = OpLoad %66 
                                         f32 %142 = OpLoad %57 
                                         f32 %143 = OpFAdd %141 %142 
                                                      OpStore %57 %143 
                                Private f32* %144 = OpAccessChain %32 %54 
                                         f32 %145 = OpLoad %144 
                                Private f32* %146 = OpAccessChain %32 %61 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpExtInst %1 37 %145 %147 
                                                      OpStore %66 %148 
                                Private f32* %149 = OpAccessChain %32 %54 
                                         f32 %150 = OpLoad %149 
                                Private f32* %151 = OpAccessChain %32 %61 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpExtInst %1 40 %150 %152 
                                                      OpStore %83 %153 
                                         f32 %154 = OpLoad %66 
                                         f32 %155 = OpLoad %66 
                                         f32 %156 = OpFNegate %155 
                                        bool %157 = OpFOrdLessThan %154 %156 
                                                      OpStore %131 %157 
                                         f32 %159 = OpLoad %83 
                                         f32 %160 = OpLoad %83 
                                         f32 %161 = OpFNegate %160 
                                        bool %162 = OpFOrdGreaterThanEqual %159 %161 
                                                      OpStore %158 %162 
                                        bool %163 = OpLoad %158 
                                        bool %164 = OpLoad %131 
                                        bool %165 = OpLogicalAnd %163 %164 
                                                      OpStore %131 %165 
                                        bool %166 = OpLoad %131 
                                                      OpSelectionMerge %170 None 
                                                      OpBranchConditional %166 %169 %173 
                                             %169 = OpLabel 
                                         f32 %171 = OpLoad %57 
                                         f32 %172 = OpFNegate %171 
                                                      OpStore %168 %172 
                                                      OpBranch %170 
                                             %173 = OpLabel 
                                         f32 %174 = OpLoad %57 
                                                      OpStore %168 %174 
                                                      OpBranch %170 
                                             %170 = OpLabel 
                                         f32 %175 = OpLoad %168 
                                                      OpStore %57 %175 
                                       f32_2 %176 = OpLoad %32 
                                       f32_2 %177 = OpLoad %32 
                                         f32 %178 = OpDot %176 %177 
                                                      OpStore %66 %178 
                                         f32 %179 = OpLoad %66 
                                         f32 %180 = OpExtInst %1 31 %179 
                                                      OpStore %66 %180 
                                         f32 %181 = OpLoad %66 
                                Uniform f32* %183 = OpAccessChain %17 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                                      OpStore %83 %185 
                                         f32 %186 = OpLoad %83 
                                         f32 %188 = OpFMul %186 %187 
                                         f32 %190 = OpFAdd %188 %189 
                                                      OpStore %83 %190 
                                         f32 %192 = OpLoad %57 
                                         f32 %194 = OpFMul %192 %193 
                                                      OpStore %191 %194 
                                         f32 %195 = OpLoad %191 
                                         f32 %196 = OpExtInst %1 14 %195 
                                                      OpStore %191 %196 
                                         f32 %197 = OpLoad %57 
                                         f32 %198 = OpLoad %191 
                                         f32 %199 = OpFAdd %197 %198 
                                                      OpStore %191 %199 
                                Private f32* %200 = OpAccessChain %45 %54 
                                         f32 %201 = OpLoad %200 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %204 = OpLoad %191 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %191 %205 
                                         f32 %206 = OpLoad %191 
                                         f32 %207 = OpExtInst %1 14 %206 
                                                      OpStore %191 %207 
                                         f32 %208 = OpLoad %191 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %211 = OpLoad %83 
                                         f32 %212 = OpFAdd %210 %211 
                                                      OpStore %83 %212 
                                         f32 %213 = OpLoad %83 
                                         f32 %214 = OpExtInst %1 43 %213 %124 %74 
                                                      OpStore %83 %214 
                                         f32 %215 = OpLoad %66 
                                         f32 %216 = OpFNegate %215 
                                Uniform f32* %217 = OpAccessChain %17 %182 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                         f32 %220 = OpLoad %57 
                                         f32 %221 = OpFAdd %219 %220 
                                                      OpStore %57 %221 
                                                      OpStore %66 %124 
                                                      OpStore %223 %35 
                                                      OpBranch %224 
                                             %224 = OpLabel 
                                                      OpLoopMerge %226 %227 None 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                         i32 %229 = OpLoad %223 
                                        bool %230 = OpSLessThan %229 %19 
                                                      OpBranchConditional %230 %225 %226 
                                             %225 = OpLabel 
                                         i32 %232 = OpLoad %223 
                                         f32 %233 = OpConvertSToF %232 
                                Private f32* %234 = OpAccessChain %231 %54 
                                                      OpStore %234 %233 
                                         f32 %236 = OpLoad %57 
                                Private f32* %237 = OpAccessChain %231 %54 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFMul %236 %238 
                                Private f32* %240 = OpAccessChain %45 %54 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %235 %54 
                                                      OpStore %243 %242 
                                       f32_2 %244 = OpLoad %32 
                                       f32_2 %245 = OpLoad %235 
                                       f32_2 %246 = OpVectorShuffle %245 %245 0 0 
                                       f32_2 %247 = OpFAdd %244 %246 
                                                      OpStore %235 %247 
                                       f32_2 %248 = OpLoad %231 
                                       f32_2 %249 = OpVectorShuffle %248 %248 0 0 
                                       f32_2 %250 = OpLoad %235 
                                       f32_2 %251 = OpFAdd %249 %250 
                                                      OpStore %231 %251 
                                       f32_2 %252 = OpLoad %231 
                                       f32_2 %253 = OpExtInst %1 14 %252 
                                                      OpStore %231 %253 
                                       f32_2 %254 = OpLoad %231 
                                       f32_2 %257 = OpFMul %254 %256 
                                       f32_2 %258 = OpLoad %32 
                                       f32_2 %259 = OpFAdd %257 %258 
                                                      OpStore %231 %259 
                                       f32_2 %261 = OpLoad %231 
                                       f32_2 %262 = OpExtInst %1 4 %261 
                                       f32_2 %265 = OpFMul %262 %264 
                                                      OpStore %260 %265 
                                       f32_2 %267 = OpLoad %260 
                                       f32_2 %268 = OpExtInst %1 10 %267 
                                                      OpStore %266 %268 
                                       f32_2 %269 = OpLoad %266 
                                       f32_2 %272 = OpFAdd %269 %271 
                                                      OpStore %266 %272 
                                       f32_2 %273 = OpLoad %260 
                                       f32_2 %274 = OpExtInst %1 8 %273 
                                                      OpStore %260 %274 
                                                      OpStore %275 %74 
                                Private f32* %278 = OpAccessChain %276 %54 
                                                      OpStore %278 %277 
                                                      OpBranch %279 
                                             %279 = OpLabel 
                                                      OpLoopMerge %281 %282 None 
                                                      OpBranch %283 
                                             %283 = OpLabel 
                                                      OpBranchConditional %284 %280 %281 
                                             %280 = OpLabel 
                                Private f32* %286 = OpAccessChain %276 %54 
                                         f32 %287 = OpLoad %286 
                                        bool %288 = OpFOrdGreaterThanEqual %287 %202 
                                                      OpStore %285 %288 
                                        bool %289 = OpLoad %285 
                                                      OpSelectionMerge %291 None 
                                                      OpBranchConditional %289 %290 %291 
                                             %290 = OpLabel 
                                                      OpBranch %281 
                                             %291 = OpLabel 
                                         f32 %294 = OpLoad %275 
                                                      OpStore %293 %294 
                                Private f32* %295 = OpAccessChain %276 %61 
                                                      OpStore %295 %277 
                                                      OpBranch %296 
                                             %296 = OpLabel 
                                                      OpLoopMerge %298 %299 None 
                                                      OpBranch %300 
                                             %300 = OpLabel 
                                                      OpBranchConditional %284 %297 %298 
                                             %297 = OpLabel 
                                Private f32* %302 = OpAccessChain %276 %61 
                                         f32 %303 = OpLoad %302 
                                        bool %304 = OpFOrdGreaterThanEqual %303 %202 
                                                      OpStore %301 %304 
                                        bool %305 = OpLoad %301 
                                                      OpSelectionMerge %307 None 
                                                      OpBranchConditional %305 %306 %307 
                                             %306 = OpLabel 
                                                      OpBranch %298 
                                             %307 = OpLabel 
                                       f32_2 %310 = OpLoad %260 
                                       f32_2 %311 = OpLoad %276 
                                       f32_2 %312 = OpFAdd %310 %311 
                                                      OpStore %309 %312 
                                       f32_2 %313 = OpLoad %309 
                                Uniform f32* %314 = OpAccessChain %17 %46 
                                         f32 %315 = OpLoad %314 
                                       f32_2 %316 = OpCompositeConstruct %315 %315 
                                       f32_2 %317 = OpFAdd %313 %316 
                                                      OpStore %309 %317 
                                       f32_2 %318 = OpLoad %309 
                                       f32_2 %319 = OpExtInst %1 14 %318 
                                                      OpStore %309 %319 
                                Private f32* %321 = OpAccessChain %309 %61 
                                         f32 %322 = OpLoad %321 
                                Private f32* %323 = OpAccessChain %309 %54 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpFAdd %322 %324 
                                                      OpStore %320 %325 
                                         f32 %326 = OpLoad %320 
                                       f32_2 %327 = OpCompositeConstruct %326 %326 
                                       f32_2 %330 = OpFMul %327 %329 
                                       f32_2 %331 = OpLoad %266 
                                       f32_2 %332 = OpFAdd %330 %331 
                                                      OpStore %309 %332 
                                       f32_2 %333 = OpLoad %276 
                                       f32_2 %334 = OpFNegate %333 
                                       f32_2 %335 = OpLoad %309 
                                       f32_2 %336 = OpFAdd %334 %335 
                                                      OpStore %309 %336 
                                       f32_2 %337 = OpLoad %309 
                                       f32_2 %338 = OpLoad %309 
                                         f32 %339 = OpDot %337 %338 
                                                      OpStore %320 %339 
                                         f32 %340 = OpLoad %320 
                                         f32 %341 = OpExtInst %1 31 %340 
                                                      OpStore %320 %341 
                                         f32 %342 = OpLoad %320 
                                         f32 %343 = OpLoad %293 
                                         f32 %344 = OpExtInst %1 37 %342 %343 
                                                      OpStore %293 %344 
                                Private f32* %345 = OpAccessChain %276 %61 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFAdd %346 %74 
                                Private f32* %348 = OpAccessChain %276 %61 
                                                      OpStore %348 %347 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                                      OpBranch %296 
                                             %298 = OpLabel 
                                         f32 %349 = OpLoad %293 
                                                      OpStore %275 %349 
                                Private f32* %350 = OpAccessChain %276 %54 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %351 %74 
                                Private f32* %353 = OpAccessChain %276 %54 
                                                      OpStore %353 %352 
                                                      OpBranch %282 
                                             %282 = OpLabel 
                                                      OpBranch %279 
                                             %281 = OpLabel 
                                       f32_2 %354 = OpLoad %231 
                                       f32_2 %358 = OpFMul %354 %357 
                                                      OpStore %231 %358 
                                       f32_2 %359 = OpLoad %231 
                                       f32_2 %360 = OpExtInst %1 14 %359 
                                                      OpStore %231 %360 
                                Private f32* %361 = OpAccessChain %231 %61 
                                         f32 %362 = OpLoad %361 
                                Private f32* %363 = OpAccessChain %231 %54 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFAdd %362 %364 
                                Private f32* %366 = OpAccessChain %231 %54 
                                                      OpStore %366 %365 
                                Private f32* %367 = OpAccessChain %231 %54 
                                         f32 %368 = OpLoad %367 
                                         f32 %370 = OpFMul %368 %369 
                                         f32 %372 = OpFAdd %370 %371 
                                Private f32* %373 = OpAccessChain %231 %54 
                                                      OpStore %373 %372 
                                         f32 %374 = OpLoad %275 
                                Private f32* %375 = OpAccessChain %231 %54 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFMul %374 %376 
                                         f32 %378 = OpLoad %66 
                                         f32 %379 = OpFAdd %377 %378 
                                                      OpStore %66 %379 
                                                      OpBranch %227 
                                             %227 = OpLabel 
                                         i32 %380 = OpLoad %223 
                                         i32 %381 = OpIAdd %380 %182 
                                                      OpStore %223 %381 
                                                      OpBranch %224 
                                             %226 = OpLabel 
                         read_only Texture2D %385 = OpLoad %384 
                                     sampler %389 = OpLoad %388 
                  read_only Texture2DSampled %391 = OpSampledImage %385 %389 
                                       f32_3 %392 = OpLoad %9 
                                       f32_2 %393 = OpVectorShuffle %392 %392 0 1 
                                       f32_4 %394 = OpImageSampleImplicitLod %391 %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                                      OpStore %9 %395 
                                         f32 %396 = OpLoad %66 
                                       f32_3 %397 = OpCompositeConstruct %396 %396 %396 
                              Uniform f32_4* %399 = OpAccessChain %17 %398 
                                       f32_4 %400 = OpLoad %399 
                                       f32_3 %401 = OpVectorShuffle %400 %400 0 1 2 
                                       f32_3 %402 = OpFMul %397 %401 
                                                      OpStore %45 %402 
                                         f32 %403 = OpLoad %83 
                                       f32_3 %404 = OpCompositeConstruct %403 %403 %403 
                                       f32_3 %405 = OpLoad %45 
                                       f32_3 %406 = OpFMul %404 %405 
                                                      OpStore %45 %406 
                                       f32_3 %409 = OpLoad %45 
                              Uniform f32_4* %410 = OpAccessChain %17 %398 
                                       f32_4 %411 = OpLoad %410 
                                       f32_3 %412 = OpVectorShuffle %411 %411 3 3 3 
                                       f32_3 %413 = OpFMul %409 %412 
                                       f32_3 %414 = OpLoad %9 
                                       f32_3 %415 = OpFAdd %413 %414 
                                       f32_4 %416 = OpLoad %408 
                                       f32_4 %417 = OpVectorShuffle %416 %415 4 5 6 3 
                                                      OpStore %408 %417 
                                 Output f32* %420 = OpAccessChain %408 %418 
                                                      OpStore %420 %74 
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