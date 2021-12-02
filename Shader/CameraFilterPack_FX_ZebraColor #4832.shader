//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_ZebraColor" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Value ("_Value", Range(1, 10)) = 10
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 24008
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Value;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
vec2 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat8 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat8 = u_xlat8 * u_xlat12;
    u_xlat12 = u_xlat8 * u_xlat8;
    u_xlat13 = u_xlat12 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat12 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat12 * u_xlat13 + -0.330299497;
    u_xlat12 = u_xlat12 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat12 * u_xlat8;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb2 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
    u_xlat8 = u_xlat8 * u_xlat12 + u_xlat13;
    u_xlatb12 = u_xlat1.y<(-u_xlat1.y);
    u_xlat12 = u_xlatb12 ? -3.14159274 : float(0.0);
    u_xlat8 = u_xlat12 + u_xlat8;
    u_xlat12 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb12 = u_xlat12<(-u_xlat12);
    u_xlat13 = max(u_xlat1.y, u_xlat1.x);
    u_xlatb13 = u_xlat13>=(-u_xlat13);
    u_xlatb12 = u_xlatb12 && u_xlatb13;
    u_xlat8 = (u_xlatb12) ? (-u_xlat8) : u_xlat8;
    u_xlat8 = u_xlat8 * _Value;
    u_xlat8 = u_xlat8 * 0.636619747;
    u_xlat8 = floor(u_xlat8);
    u_xlat8 = u_xlat8 * 3.14159274;
    u_xlat8 = u_xlat8 / _Value;
    u_xlat8 = u_xlat8 + 1.57079637;
    u_xlat2 = sin(u_xlat8);
    u_xlat3.x = cos(u_xlat8);
    u_xlat3.y = u_xlat2;
    u_xlat0.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = u_xlat1.y + u_xlat1.x;
    u_xlat4.x = u_xlat1.z + u_xlat4.x;
    u_xlat4.x = u_xlat4.x * _Value;
    u_xlat4.x = u_xlat4.x * 0.333333343;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat4.x = u_xlat4.x / _Value;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
    u_xlat4.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat1.xyz / u_xlat4.xxx;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
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
; Bound: 285
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %274 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %274 Location 274 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %13 = OpTypeVector %6 4 
                                     %14 = OpTypeStruct %13 %6 %13 
                                     %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %13 
                                     %28 = OpTypeVector %6 3 
                                     %29 = OpTypePointer Private %28 
                      Private f32_3* %30 = OpVariable Private 
                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %32 = OpTypePointer UniformConstant %31 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                     %35 = OpTypeSampler 
                                     %36 = OpTypePointer UniformConstant %35 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampledImage %31 
                                 i32 %45 = OpConstant 0 
                                     %50 = OpTypePointer Private %6 
                        Private f32* %51 = OpVariable Private 
                                     %52 = OpTypeInt 32 0 
                                 u32 %53 = OpConstant 1 
                                 u32 %57 = OpConstant 0 
                                 f32 %62 = OpConstant 3.674022E-40 
                        Private f32* %65 = OpVariable Private 
                        Private f32* %79 = OpVariable Private 
                                 f32 %81 = OpConstant 3.674022E-40 
                                 f32 %83 = OpConstant 3.674022E-40 
                                 f32 %88 = OpConstant 3.674022E-40 
                                 f32 %93 = OpConstant 3.674022E-40 
                                 f32 %98 = OpConstant 3.674022E-40 
                                f32 %104 = OpConstant 3.674022E-40 
                                f32 %106 = OpConstant 3.674022E-40 
                                    %108 = OpTypeBool 
                                    %109 = OpTypePointer Private %108 
                      Private bool* %110 = OpVariable Private 
                                f32 %120 = OpConstant 3.674022E-40 
                      Private bool* %127 = OpVariable Private 
                                f32 %135 = OpConstant 3.674022E-40 
                      Private bool* %154 = OpVariable Private 
                                    %163 = OpTypePointer Function %6 
                                i32 %173 = OpConstant 1 
                                    %174 = OpTypePointer Uniform %6 
                                f32 %179 = OpConstant 3.674022E-40 
                                f32 %184 = OpConstant 3.674022E-40 
                       Private f32* %192 = OpVariable Private 
                     Private f32_2* %195 = OpVariable Private 
                     Private f32_3* %205 = OpVariable Private 
                                u32 %212 = OpConstant 2 
                                f32 %227 = OpConstant 3.674022E-40 
                                f32 %257 = OpConstant 3.674022E-40 
                                    %273 = OpTypePointer Output %13 
                      Output f32_4* %274 = OpVariable Output 
                                u32 %281 = OpConstant 3 
                                    %282 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Function f32* %164 = OpVariable Function 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                               f32_2 %41 = OpLoad %9 
                               f32_4 %42 = OpImageSampleImplicitLod %40 %41 
                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                                             OpStore %30 %43 
                               f32_2 %44 = OpLoad %9 
                      Uniform f32_4* %46 = OpAccessChain %16 %45 
                               f32_4 %47 = OpLoad %46 
                               f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                               f32_2 %49 = OpFMul %44 %48 
                                             OpStore %9 %49 
                        Private f32* %54 = OpAccessChain %30 %53 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpExtInst %1 4 %55 
                        Private f32* %58 = OpAccessChain %30 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpExtInst %1 4 %59 
                                 f32 %61 = OpExtInst %1 40 %56 %60 
                                             OpStore %51 %61 
                                 f32 %63 = OpLoad %51 
                                 f32 %64 = OpFDiv %62 %63 
                                             OpStore %51 %64 
                        Private f32* %66 = OpAccessChain %30 %53 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpExtInst %1 4 %67 
                        Private f32* %69 = OpAccessChain %30 %57 
                                 f32 %70 = OpLoad %69 
                                 f32 %71 = OpExtInst %1 4 %70 
                                 f32 %72 = OpExtInst %1 37 %68 %71 
                                             OpStore %65 %72 
                                 f32 %73 = OpLoad %51 
                                 f32 %74 = OpLoad %65 
                                 f32 %75 = OpFMul %73 %74 
                                             OpStore %51 %75 
                                 f32 %76 = OpLoad %51 
                                 f32 %77 = OpLoad %51 
                                 f32 %78 = OpFMul %76 %77 
                                             OpStore %65 %78 
                                 f32 %80 = OpLoad %65 
                                 f32 %82 = OpFMul %80 %81 
                                 f32 %84 = OpFAdd %82 %83 
                                             OpStore %79 %84 
                                 f32 %85 = OpLoad %65 
                                 f32 %86 = OpLoad %79 
                                 f32 %87 = OpFMul %85 %86 
                                 f32 %89 = OpFAdd %87 %88 
                                             OpStore %79 %89 
                                 f32 %90 = OpLoad %65 
                                 f32 %91 = OpLoad %79 
                                 f32 %92 = OpFMul %90 %91 
                                 f32 %94 = OpFAdd %92 %93 
                                             OpStore %79 %94 
                                 f32 %95 = OpLoad %65 
                                 f32 %96 = OpLoad %79 
                                 f32 %97 = OpFMul %95 %96 
                                 f32 %99 = OpFAdd %97 %98 
                                             OpStore %65 %99 
                                f32 %100 = OpLoad %65 
                                f32 %101 = OpLoad %51 
                                f32 %102 = OpFMul %100 %101 
                                             OpStore %79 %102 
                                f32 %103 = OpLoad %79 
                                f32 %105 = OpFMul %103 %104 
                                f32 %107 = OpFAdd %105 %106 
                                             OpStore %79 %107 
                       Private f32* %111 = OpAccessChain %30 %53 
                                f32 %112 = OpLoad %111 
                                f32 %113 = OpExtInst %1 4 %112 
                       Private f32* %114 = OpAccessChain %30 %57 
                                f32 %115 = OpLoad %114 
                                f32 %116 = OpExtInst %1 4 %115 
                               bool %117 = OpFOrdLessThan %113 %116 
                                             OpStore %110 %117 
                               bool %118 = OpLoad %110 
                                f32 %119 = OpLoad %79 
                                f32 %121 = OpSelect %118 %119 %120 
                                             OpStore %79 %121 
                                f32 %122 = OpLoad %51 
                                f32 %123 = OpLoad %65 
                                f32 %124 = OpFMul %122 %123 
                                f32 %125 = OpLoad %79 
                                f32 %126 = OpFAdd %124 %125 
                                             OpStore %51 %126 
                       Private f32* %128 = OpAccessChain %30 %53 
                                f32 %129 = OpLoad %128 
                       Private f32* %130 = OpAccessChain %30 %53 
                                f32 %131 = OpLoad %130 
                                f32 %132 = OpFNegate %131 
                               bool %133 = OpFOrdLessThan %129 %132 
                                             OpStore %127 %133 
                               bool %134 = OpLoad %127 
                                f32 %136 = OpSelect %134 %135 %120 
                                             OpStore %65 %136 
                                f32 %137 = OpLoad %65 
                                f32 %138 = OpLoad %51 
                                f32 %139 = OpFAdd %137 %138 
                                             OpStore %51 %139 
                       Private f32* %140 = OpAccessChain %30 %53 
                                f32 %141 = OpLoad %140 
                       Private f32* %142 = OpAccessChain %30 %57 
                                f32 %143 = OpLoad %142 
                                f32 %144 = OpExtInst %1 37 %141 %143 
                                             OpStore %65 %144 
                                f32 %145 = OpLoad %65 
                                f32 %146 = OpLoad %65 
                                f32 %147 = OpFNegate %146 
                               bool %148 = OpFOrdLessThan %145 %147 
                                             OpStore %127 %148 
                       Private f32* %149 = OpAccessChain %30 %53 
                                f32 %150 = OpLoad %149 
                       Private f32* %151 = OpAccessChain %30 %57 
                                f32 %152 = OpLoad %151 
                                f32 %153 = OpExtInst %1 40 %150 %152 
                                             OpStore %79 %153 
                                f32 %155 = OpLoad %79 
                                f32 %156 = OpLoad %79 
                                f32 %157 = OpFNegate %156 
                               bool %158 = OpFOrdGreaterThanEqual %155 %157 
                                             OpStore %154 %158 
                               bool %159 = OpLoad %127 
                               bool %160 = OpLoad %154 
                               bool %161 = OpLogicalAnd %159 %160 
                                             OpStore %127 %161 
                               bool %162 = OpLoad %127 
                                             OpSelectionMerge %166 None 
                                             OpBranchConditional %162 %165 %169 
                                    %165 = OpLabel 
                                f32 %167 = OpLoad %51 
                                f32 %168 = OpFNegate %167 
                                             OpStore %164 %168 
                                             OpBranch %166 
                                    %169 = OpLabel 
                                f32 %170 = OpLoad %51 
                                             OpStore %164 %170 
                                             OpBranch %166 
                                    %166 = OpLabel 
                                f32 %171 = OpLoad %164 
                                             OpStore %51 %171 
                                f32 %172 = OpLoad %51 
                       Uniform f32* %175 = OpAccessChain %16 %173 
                                f32 %176 = OpLoad %175 
                                f32 %177 = OpFMul %172 %176 
                                             OpStore %51 %177 
                                f32 %178 = OpLoad %51 
                                f32 %180 = OpFMul %178 %179 
                                             OpStore %51 %180 
                                f32 %181 = OpLoad %51 
                                f32 %182 = OpExtInst %1 8 %181 
                                             OpStore %51 %182 
                                f32 %183 = OpLoad %51 
                                f32 %185 = OpFMul %183 %184 
                                             OpStore %51 %185 
                                f32 %186 = OpLoad %51 
                       Uniform f32* %187 = OpAccessChain %16 %173 
                                f32 %188 = OpLoad %187 
                                f32 %189 = OpFDiv %186 %188 
                                             OpStore %51 %189 
                                f32 %190 = OpLoad %51 
                                f32 %191 = OpFAdd %190 %106 
                                             OpStore %51 %191 
                                f32 %193 = OpLoad %51 
                                f32 %194 = OpExtInst %1 13 %193 
                                             OpStore %192 %194 
                                f32 %196 = OpLoad %51 
                                f32 %197 = OpExtInst %1 14 %196 
                       Private f32* %198 = OpAccessChain %195 %57 
                                             OpStore %198 %197 
                                f32 %199 = OpLoad %192 
                       Private f32* %200 = OpAccessChain %195 %53 
                                             OpStore %200 %199 
                              f32_2 %201 = OpLoad %195 
                              f32_2 %202 = OpLoad %9 
                                f32 %203 = OpDot %201 %202 
                       Private f32* %204 = OpAccessChain %9 %57 
                                             OpStore %204 %203 
                       Private f32* %206 = OpAccessChain %30 %53 
                                f32 %207 = OpLoad %206 
                       Private f32* %208 = OpAccessChain %30 %57 
                                f32 %209 = OpLoad %208 
                                f32 %210 = OpFAdd %207 %209 
                       Private f32* %211 = OpAccessChain %205 %57 
                                             OpStore %211 %210 
                       Private f32* %213 = OpAccessChain %30 %212 
                                f32 %214 = OpLoad %213 
                       Private f32* %215 = OpAccessChain %205 %57 
                                f32 %216 = OpLoad %215 
                                f32 %217 = OpFAdd %214 %216 
                       Private f32* %218 = OpAccessChain %205 %57 
                                             OpStore %218 %217 
                       Private f32* %219 = OpAccessChain %205 %57 
                                f32 %220 = OpLoad %219 
                       Uniform f32* %221 = OpAccessChain %16 %173 
                                f32 %222 = OpLoad %221 
                                f32 %223 = OpFMul %220 %222 
                       Private f32* %224 = OpAccessChain %205 %57 
                                             OpStore %224 %223 
                       Private f32* %225 = OpAccessChain %205 %57 
                                f32 %226 = OpLoad %225 
                                f32 %228 = OpFMul %226 %227 
                       Private f32* %229 = OpAccessChain %205 %57 
                                             OpStore %229 %228 
                       Private f32* %230 = OpAccessChain %205 %57 
                                f32 %231 = OpLoad %230 
                                f32 %232 = OpExtInst %1 8 %231 
                       Private f32* %233 = OpAccessChain %205 %57 
                                             OpStore %233 %232 
                       Private f32* %234 = OpAccessChain %205 %57 
                                f32 %235 = OpLoad %234 
                       Uniform f32* %236 = OpAccessChain %16 %173 
                                f32 %237 = OpLoad %236 
                                f32 %238 = OpFDiv %235 %237 
                       Private f32* %239 = OpAccessChain %205 %57 
                                             OpStore %239 %238 
                       Private f32* %240 = OpAccessChain %9 %57 
                                f32 %241 = OpLoad %240 
                       Private f32* %242 = OpAccessChain %205 %57 
                                f32 %243 = OpLoad %242 
                                f32 %244 = OpFMul %241 %243 
                       Private f32* %245 = OpAccessChain %9 %57 
                                             OpStore %245 %244 
                       Private f32* %246 = OpAccessChain %9 %57 
                                f32 %247 = OpLoad %246 
                                f32 %248 = OpFMul %247 %184 
                       Private f32* %249 = OpAccessChain %9 %57 
                                             OpStore %249 %248 
                       Private f32* %250 = OpAccessChain %9 %57 
                                f32 %251 = OpLoad %250 
                                f32 %252 = OpExtInst %1 14 %251 
                       Private f32* %253 = OpAccessChain %9 %57 
                                             OpStore %253 %252 
                       Private f32* %254 = OpAccessChain %9 %57 
                                f32 %255 = OpLoad %254 
                                f32 %256 = OpFNegate %255 
                                f32 %258 = OpFMul %256 %257 
                                f32 %259 = OpFAdd %258 %257 
                       Private f32* %260 = OpAccessChain %9 %57 
                                             OpStore %260 %259 
                              f32_3 %261 = OpLoad %30 
                              f32_3 %262 = OpLoad %30 
                                f32 %263 = OpDot %261 %262 
                       Private f32* %264 = OpAccessChain %205 %57 
                                             OpStore %264 %263 
                       Private f32* %265 = OpAccessChain %205 %57 
                                f32 %266 = OpLoad %265 
                                f32 %267 = OpExtInst %1 31 %266 
                       Private f32* %268 = OpAccessChain %205 %57 
                                             OpStore %268 %267 
                              f32_3 %269 = OpLoad %30 
                              f32_3 %270 = OpLoad %205 
                              f32_3 %271 = OpVectorShuffle %270 %270 0 0 0 
                              f32_3 %272 = OpFDiv %269 %271 
                                             OpStore %205 %272 
                              f32_3 %275 = OpLoad %205 
                              f32_2 %276 = OpLoad %9 
                              f32_3 %277 = OpVectorShuffle %276 %276 0 0 0 
                              f32_3 %278 = OpFMul %275 %277 
                              f32_4 %279 = OpLoad %274 
                              f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                             OpStore %274 %280 
                        Output f32* %283 = OpAccessChain %274 %281 
                                             OpStore %283 %62 
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