//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Drawing_Crosshatch" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 10)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 54257
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
uniform 	float _Distortion;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec4 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
    u_xlat1 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
    u_xlat2 = u_xlat0 * u_xlat2;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat2.x = dot(u_xlat2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
    u_xlat3 = u_xlat0 * u_xlat3;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat14 = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.x = (-u_xlat20) + (-u_xlat8);
    u_xlat8 = u_xlat2.x * -2.0 + (-u_xlat8);
    u_xlat2.x = (-u_xlat2.x) + u_xlat8;
    u_xlat2.x = u_xlat20 + u_xlat2.x;
    u_xlat2.x = u_xlat14 * 2.0 + u_xlat2.x;
    u_xlat4 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
    u_xlat4 = u_xlat0 * u_xlat4;
    u_xlat5 = texture(_MainTex, u_xlat4.xy);
    u_xlat4 = texture(_MainTex, u_xlat4.zw);
    u_xlat8 = dot(u_xlat4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat14 = dot(u_xlat5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat20 = u_xlat14 + u_xlat3.x;
    u_xlat2.x = u_xlat14 + u_xlat2.x;
    u_xlat8 = u_xlat8 * -2.0 + u_xlat20;
    u_xlat3 = u_xlat1 * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat6.x = dot(u_xlat3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat6.x = u_xlat6.x + u_xlat8;
    u_xlat0.x = u_xlat0.x * 2.0 + u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat2.x * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.xy = u_xlat1.zw * _ScreenResolution.xy;
    u_xlat6.z = u_xlat1.z * _ScreenResolution.x + (-u_xlat6.y);
    u_xlat6.x = u_xlat6.y + u_xlat6.x;
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat12 = u_xlat6.z * 0.100000001;
    u_xlat12 = floor(u_xlat12);
    u_xlat12 = (-u_xlat12) * 10.0 + u_xlat6.z;
    u_xlatb12 = _Distortion>=u_xlat12;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
    u_xlat19 = min(u_xlat1.z, u_xlat19);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.z, u_xlat2.x);
    u_xlat19 = (-u_xlat19) + u_xlat2.x;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xxx;
    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlatb3 = lessThan(u_xlat1.xxxx, vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
    u_xlatb1 = 0.100000001<u_xlat19;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat19 = u_xlat6.x * 0.100000001;
    u_xlat19 = floor(u_xlat19);
    u_xlat19 = (-u_xlat19) * 10.0 + u_xlat6.x;
    u_xlat6.xz = u_xlat6.xz + vec2(-5.0, -5.0);
    u_xlatb19 = _Distortion>=u_xlat19;
    u_xlat2.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = (u_xlatb3.x) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat4.xyz = (bool(u_xlatb12)) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat2.xyz = (u_xlatb3.y) ? u_xlat4.xyz : u_xlat2.xyz;
    u_xlat12 = u_xlat6.x * 0.100000001;
    u_xlat12 = floor(u_xlat12);
    u_xlat6.x = (-u_xlat12) * 10.0 + u_xlat6.x;
    u_xlatb6 = _Distortion>=u_xlat6.x;
    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat1.xyz = (u_xlatb3.z) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat6.x = u_xlat6.z * 0.100000001;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.x) * 10.0 + u_xlat6.z;
    u_xlatb6 = _Distortion>=u_xlat6.x;
    u_xlat6.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat6.xyz = (u_xlatb3.w) ? u_xlat6.xyz : u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz;
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
; Bound: 595
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %585 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %12 0 Offset 12 
                                             OpMemberDecorate %12 1 Offset 12 
                                             OpMemberDecorate %12 2 Offset 12 
                                             OpDecorate %12 Block 
                                             OpDecorate %14 DescriptorSet 14 
                                             OpDecorate %14 Binding 14 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %54 DescriptorSet 54 
                                             OpDecorate %54 Binding 54 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %585 Location 585 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                 f32 %10 = OpConstant 3.674022E-40 
                               f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
                                     %12 = OpTypeStruct %6 %7 %7 
                                     %13 = OpTypePointer Uniform %12 
Uniform struct {f32; f32_4; f32_4;}* %14 = OpVariable Uniform 
                                     %15 = OpTypeInt 32 1 
                                 i32 %16 = OpConstant 1 
                                     %17 = OpTypePointer Uniform %7 
                      Private f32_4* %22 = OpVariable Private 
                                     %23 = OpTypeVector %6 2 
                                     %24 = OpTypePointer Input %23 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %28 = OpConstant 2 
                      Private f32_4* %37 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 f32 %45 = OpConstant 3.674022E-40 
                               f32_4 %46 = OpConstantComposite %44 %44 %44 %45 
                      Private f32_4* %51 = OpVariable Private 
                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %53 = OpTypePointer UniformConstant %52 
UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
                                     %56 = OpTypeSampler 
                                     %57 = OpTypePointer UniformConstant %56 
            UniformConstant sampler* %58 = OpVariable UniformConstant 
                                     %60 = OpTypeSampledImage %52 
                                     %65 = OpTypeVector %6 3 
                                 f32 %80 = OpConstant 3.674022E-40 
                                 f32 %81 = OpConstant 3.674022E-40 
                                 f32 %82 = OpConstant 3.674022E-40 
                               f32_3 %83 = OpConstantComposite %80 %81 %82 
                                     %85 = OpTypeInt 32 0 
                                 u32 %86 = OpConstant 0 
                                     %87 = OpTypePointer Private %6 
                                     %89 = OpTypePointer Private %65 
                      Private f32_3* %90 = OpVariable Private 
                              f32_4 %101 = OpConstantComposite %10 %44 %10 %45 
                     Private f32_4* %106 = OpVariable Private 
                       Private f32* %125 = OpVariable Private 
                       Private f32* %129 = OpVariable Private 
                                f32 %142 = OpConstant 3.674022E-40 
                                f32 %162 = OpConstant 3.674022E-40 
                              f32_4 %174 = OpConstantComposite %10 %10 %45 %44 
                     Private f32_3* %186 = OpVariable Private 
                              f32_4 %222 = OpConstantComposite %44 %10 %45 %10 
                     Private f32_3* %249 = OpVariable Private 
                                u32 %295 = OpConstant 2 
                                    %298 = OpTypePointer Uniform %6 
                                u32 %302 = OpConstant 1 
                       Private f32* %323 = OpVariable Private 
                                f32 %326 = OpConstant 3.674022E-40 
                                f32 %332 = OpConstant 3.674022E-40 
                                    %337 = OpTypeBool 
                                    %338 = OpTypePointer Private %337 
                      Private bool* %339 = OpVariable Private 
                                i32 %340 = OpConstant 0 
                       Private f32* %345 = OpVariable Private 
                                    %387 = OpTypeVector %337 4 
                                    %388 = OpTypePointer Private %387 
                    Private bool_4* %389 = OpVariable Private 
                                f32 %392 = OpConstant 3.674022E-40 
                                f32 %393 = OpConstant 3.674022E-40 
                                f32 %394 = OpConstant 3.674022E-40 
                                f32 %395 = OpConstant 3.674022E-40 
                              f32_4 %396 = OpConstantComposite %392 %393 %394 %395 
                      Private bool* %398 = OpVariable Private 
                                    %402 = OpTypePointer Function %65 
                              f32_3 %409 = OpConstantComposite %10 %10 %10 
                              f32_3 %415 = OpConstantComposite %392 %392 %392 
                                f32 %432 = OpConstant 3.674022E-40 
                              f32_2 %433 = OpConstantComposite %432 %432 
                      Private bool* %437 = OpVariable Private 
                              f32_3 %465 = OpConstantComposite %393 %393 %393 
                              f32_3 %471 = OpConstantComposite %394 %394 %394 
                      Private bool* %512 = OpVariable Private 
                              f32_3 %568 = OpConstantComposite %45 %45 %45 
                                u32 %573 = OpConstant 3 
                                    %584 = OpTypePointer Output %7 
                      Output f32_4* %585 = OpVariable Output 
                                    %592 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %403 = OpVariable Function 
                    Function f32_3* %443 = OpVariable Function 
                    Function f32_3* %454 = OpVariable Function 
                    Function f32_3* %476 = OpVariable Function 
                    Function f32_3* %489 = OpVariable Function 
                    Function f32_3* %519 = OpVariable Function 
                    Function f32_3* %532 = OpVariable Function 
                    Function f32_3* %565 = OpVariable Function 
                    Function f32_3* %576 = OpVariable Function 
                      Uniform f32_4* %18 = OpAccessChain %14 %16 
                               f32_4 %19 = OpLoad %18 
                               f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
                               f32_4 %21 = OpFDiv %11 %20 
                                             OpStore %9 %21 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                      Uniform f32_4* %29 = OpAccessChain %14 %28 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
                               f32_4 %32 = OpFMul %27 %31 
                      Uniform f32_4* %33 = OpAccessChain %14 %28 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpVectorShuffle %34 %34 2 3 2 3 
                               f32_4 %36 = OpFAdd %32 %35 
                                             OpStore %22 %36 
                               f32_4 %38 = OpLoad %22 
                               f32_4 %39 = OpVectorShuffle %38 %38 2 3 2 3 
                      Uniform f32_4* %40 = OpAccessChain %14 %16 
                               f32_4 %41 = OpLoad %40 
                               f32_4 %42 = OpVectorShuffle %41 %41 0 1 0 1 
                               f32_4 %43 = OpFMul %39 %42 
                               f32_4 %47 = OpFAdd %43 %46 
                                             OpStore %37 %47 
                               f32_4 %48 = OpLoad %9 
                               f32_4 %49 = OpLoad %37 
                               f32_4 %50 = OpFMul %48 %49 
                                             OpStore %37 %50 
                 read_only Texture2D %55 = OpLoad %54 
                             sampler %59 = OpLoad %58 
          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
                               f32_4 %62 = OpLoad %37 
                               f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                               f32_4 %64 = OpImageSampleImplicitLod %61 %63 
                               f32_3 %66 = OpVectorShuffle %64 %64 0 1 2 
                               f32_4 %67 = OpLoad %51 
                               f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                             OpStore %51 %68 
                 read_only Texture2D %69 = OpLoad %54 
                             sampler %70 = OpLoad %58 
          read_only Texture2DSampled %71 = OpSampledImage %69 %70 
                               f32_4 %72 = OpLoad %37 
                               f32_2 %73 = OpVectorShuffle %72 %72 2 3 
                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                               f32_4 %76 = OpLoad %37 
                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                             OpStore %37 %77 
                               f32_4 %78 = OpLoad %37 
                               f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                 f32 %84 = OpDot %79 %83 
                        Private f32* %88 = OpAccessChain %37 %86 
                                             OpStore %88 %84 
                               f32_4 %91 = OpLoad %51 
                               f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                 f32 %93 = OpDot %92 %83 
                        Private f32* %94 = OpAccessChain %90 %86 
                                             OpStore %94 %93 
                               f32_4 %95 = OpLoad %22 
                               f32_4 %96 = OpVectorShuffle %95 %95 2 3 2 3 
                      Uniform f32_4* %97 = OpAccessChain %14 %16 
                               f32_4 %98 = OpLoad %97 
                               f32_4 %99 = OpVectorShuffle %98 %98 0 1 0 1 
                              f32_4 %100 = OpFMul %96 %99 
                              f32_4 %102 = OpFAdd %100 %101 
                                             OpStore %51 %102 
                              f32_4 %103 = OpLoad %9 
                              f32_4 %104 = OpLoad %51 
                              f32_4 %105 = OpFMul %103 %104 
                                             OpStore %51 %105 
                read_only Texture2D %107 = OpLoad %54 
                            sampler %108 = OpLoad %58 
         read_only Texture2DSampled %109 = OpSampledImage %107 %108 
                              f32_4 %110 = OpLoad %51 
                              f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              f32_4 %112 = OpImageSampleImplicitLod %109 %111 
                              f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                              f32_4 %114 = OpLoad %106 
                              f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                             OpStore %106 %115 
                read_only Texture2D %116 = OpLoad %54 
                            sampler %117 = OpLoad %58 
         read_only Texture2DSampled %118 = OpSampledImage %116 %117 
                              f32_4 %119 = OpLoad %51 
                              f32_2 %120 = OpVectorShuffle %119 %119 2 3 
                              f32_4 %121 = OpImageSampleImplicitLod %118 %120 
                              f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              f32_4 %123 = OpLoad %51 
                              f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                             OpStore %51 %124 
                              f32_4 %126 = OpLoad %51 
                              f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                f32 %128 = OpDot %127 %83 
                                             OpStore %125 %128 
                              f32_4 %130 = OpLoad %106 
                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                f32 %132 = OpDot %131 %83 
                                             OpStore %129 %132 
                                f32 %133 = OpLoad %129 
                                f32 %134 = OpFNegate %133 
                       Private f32* %135 = OpAccessChain %90 %86 
                                f32 %136 = OpLoad %135 
                                f32 %137 = OpFNegate %136 
                                f32 %138 = OpFAdd %134 %137 
                       Private f32* %139 = OpAccessChain %51 %86 
                                             OpStore %139 %138 
                       Private f32* %140 = OpAccessChain %37 %86 
                                f32 %141 = OpLoad %140 
                                f32 %143 = OpFMul %141 %142 
                       Private f32* %144 = OpAccessChain %90 %86 
                                f32 %145 = OpLoad %144 
                                f32 %146 = OpFNegate %145 
                                f32 %147 = OpFAdd %143 %146 
                       Private f32* %148 = OpAccessChain %90 %86 
                                             OpStore %148 %147 
                       Private f32* %149 = OpAccessChain %37 %86 
                                f32 %150 = OpLoad %149 
                                f32 %151 = OpFNegate %150 
                       Private f32* %152 = OpAccessChain %90 %86 
                                f32 %153 = OpLoad %152 
                                f32 %154 = OpFAdd %151 %153 
                       Private f32* %155 = OpAccessChain %37 %86 
                                             OpStore %155 %154 
                                f32 %156 = OpLoad %129 
                       Private f32* %157 = OpAccessChain %37 %86 
                                f32 %158 = OpLoad %157 
                                f32 %159 = OpFAdd %156 %158 
                       Private f32* %160 = OpAccessChain %37 %86 
                                             OpStore %160 %159 
                                f32 %161 = OpLoad %125 
                                f32 %163 = OpFMul %161 %162 
                       Private f32* %164 = OpAccessChain %37 %86 
                                f32 %165 = OpLoad %164 
                                f32 %166 = OpFAdd %163 %165 
                       Private f32* %167 = OpAccessChain %37 %86 
                                             OpStore %167 %166 
                              f32_4 %168 = OpLoad %22 
                              f32_4 %169 = OpVectorShuffle %168 %168 2 3 2 3 
                     Uniform f32_4* %170 = OpAccessChain %14 %16 
                              f32_4 %171 = OpLoad %170 
                              f32_4 %172 = OpVectorShuffle %171 %171 0 1 0 1 
                              f32_4 %173 = OpFMul %169 %172 
                              f32_4 %175 = OpFAdd %173 %174 
                                             OpStore %106 %175 
                              f32_4 %176 = OpLoad %9 
                              f32_4 %177 = OpLoad %106 
                              f32_4 %178 = OpFMul %176 %177 
                                             OpStore %106 %178 
                read_only Texture2D %179 = OpLoad %54 
                            sampler %180 = OpLoad %58 
         read_only Texture2DSampled %181 = OpSampledImage %179 %180 
                              f32_4 %182 = OpLoad %106 
                              f32_2 %183 = OpVectorShuffle %182 %182 0 1 
                              f32_4 %184 = OpImageSampleImplicitLod %181 %183 
                              f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                             OpStore %90 %185 
                read_only Texture2D %187 = OpLoad %54 
                            sampler %188 = OpLoad %58 
         read_only Texture2DSampled %189 = OpSampledImage %187 %188 
                              f32_4 %190 = OpLoad %106 
                              f32_2 %191 = OpVectorShuffle %190 %190 2 3 
                              f32_4 %192 = OpImageSampleImplicitLod %189 %191 
                              f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                             OpStore %186 %193 
                              f32_3 %194 = OpLoad %186 
                                f32 %195 = OpDot %194 %83 
                       Private f32* %196 = OpAccessChain %186 %86 
                                             OpStore %196 %195 
                              f32_3 %197 = OpLoad %90 
                                f32 %198 = OpDot %197 %83 
                       Private f32* %199 = OpAccessChain %90 %86 
                                             OpStore %199 %198 
                       Private f32* %200 = OpAccessChain %90 %86 
                                f32 %201 = OpLoad %200 
                       Private f32* %202 = OpAccessChain %51 %86 
                                f32 %203 = OpLoad %202 
                                f32 %204 = OpFAdd %201 %203 
                                             OpStore %125 %204 
                       Private f32* %205 = OpAccessChain %90 %86 
                                f32 %206 = OpLoad %205 
                       Private f32* %207 = OpAccessChain %37 %86 
                                f32 %208 = OpLoad %207 
                                f32 %209 = OpFAdd %206 %208 
                       Private f32* %210 = OpAccessChain %37 %86 
                                             OpStore %210 %209 
                       Private f32* %211 = OpAccessChain %186 %86 
                                f32 %212 = OpLoad %211 
                                f32 %213 = OpFMul %212 %142 
                                f32 %214 = OpLoad %125 
                                f32 %215 = OpFAdd %213 %214 
                       Private f32* %216 = OpAccessChain %90 %86 
                                             OpStore %216 %215 
                              f32_4 %217 = OpLoad %22 
                     Uniform f32_4* %218 = OpAccessChain %14 %16 
                              f32_4 %219 = OpLoad %218 
                              f32_4 %220 = OpVectorShuffle %219 %219 0 1 0 1 
                              f32_4 %221 = OpFMul %217 %220 
                              f32_4 %223 = OpFAdd %221 %222 
                                             OpStore %51 %223 
                              f32_4 %224 = OpLoad %9 
                              f32_4 %225 = OpLoad %51 
                              f32_4 %226 = OpFMul %224 %225 
                                             OpStore %9 %226 
                read_only Texture2D %227 = OpLoad %54 
                            sampler %228 = OpLoad %58 
         read_only Texture2DSampled %229 = OpSampledImage %227 %228 
                              f32_4 %230 = OpLoad %9 
                              f32_2 %231 = OpVectorShuffle %230 %230 0 1 
                              f32_4 %232 = OpImageSampleImplicitLod %229 %231 
                              f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                              f32_4 %234 = OpLoad %51 
                              f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                             OpStore %51 %235 
                read_only Texture2D %236 = OpLoad %54 
                            sampler %237 = OpLoad %58 
         read_only Texture2DSampled %238 = OpSampledImage %236 %237 
                              f32_4 %239 = OpLoad %9 
                              f32_2 %240 = OpVectorShuffle %239 %239 2 3 
                              f32_4 %241 = OpImageSampleImplicitLod %238 %240 
                              f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              f32_4 %243 = OpLoad %9 
                              f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
                                             OpStore %9 %244 
                              f32_4 %245 = OpLoad %9 
                              f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                f32 %247 = OpDot %246 %83 
                       Private f32* %248 = OpAccessChain %9 %86 
                                             OpStore %248 %247 
                              f32_4 %250 = OpLoad %51 
                              f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                f32 %252 = OpDot %251 %83 
                       Private f32* %253 = OpAccessChain %249 %86 
                                             OpStore %253 %252 
                       Private f32* %254 = OpAccessChain %249 %86 
                                f32 %255 = OpLoad %254 
                       Private f32* %256 = OpAccessChain %90 %86 
                                f32 %257 = OpLoad %256 
                                f32 %258 = OpFAdd %255 %257 
                       Private f32* %259 = OpAccessChain %249 %86 
                                             OpStore %259 %258 
                       Private f32* %260 = OpAccessChain %9 %86 
                                f32 %261 = OpLoad %260 
                                f32 %262 = OpFMul %261 %162 
                       Private f32* %263 = OpAccessChain %249 %86 
                                f32 %264 = OpLoad %263 
                                f32 %265 = OpFAdd %262 %264 
                       Private f32* %266 = OpAccessChain %9 %86 
                                             OpStore %266 %265 
                       Private f32* %267 = OpAccessChain %9 %86 
                                f32 %268 = OpLoad %267 
                       Private f32* %269 = OpAccessChain %9 %86 
                                f32 %270 = OpLoad %269 
                                f32 %271 = OpFMul %268 %270 
                       Private f32* %272 = OpAccessChain %9 %86 
                                             OpStore %272 %271 
                       Private f32* %273 = OpAccessChain %37 %86 
                                f32 %274 = OpLoad %273 
                       Private f32* %275 = OpAccessChain %37 %86 
                                f32 %276 = OpLoad %275 
                                f32 %277 = OpFMul %274 %276 
                       Private f32* %278 = OpAccessChain %9 %86 
                                f32 %279 = OpLoad %278 
                                f32 %280 = OpFAdd %277 %279 
                       Private f32* %281 = OpAccessChain %9 %86 
                                             OpStore %281 %280 
                       Private f32* %282 = OpAccessChain %9 %86 
                                f32 %283 = OpLoad %282 
                                f32 %284 = OpFNegate %283 
                                f32 %285 = OpFAdd %284 %10 
                       Private f32* %286 = OpAccessChain %9 %86 
                                             OpStore %286 %285 
                              f32_4 %287 = OpLoad %22 
                              f32_2 %288 = OpVectorShuffle %287 %287 2 3 
                     Uniform f32_4* %289 = OpAccessChain %14 %16 
                              f32_4 %290 = OpLoad %289 
                              f32_2 %291 = OpVectorShuffle %290 %290 0 1 
                              f32_2 %292 = OpFMul %288 %291 
                              f32_3 %293 = OpLoad %249 
                              f32_3 %294 = OpVectorShuffle %293 %292 3 4 2 
                                             OpStore %249 %294 
                       Private f32* %296 = OpAccessChain %22 %295 
                                f32 %297 = OpLoad %296 
                       Uniform f32* %299 = OpAccessChain %14 %16 %86 
                                f32 %300 = OpLoad %299 
                                f32 %301 = OpFMul %297 %300 
                       Private f32* %303 = OpAccessChain %249 %302 
                                f32 %304 = OpLoad %303 
                                f32 %305 = OpFNegate %304 
                                f32 %306 = OpFAdd %301 %305 
                       Private f32* %307 = OpAccessChain %249 %295 
                                             OpStore %307 %306 
                       Private f32* %308 = OpAccessChain %249 %302 
                                f32 %309 = OpLoad %308 
                       Private f32* %310 = OpAccessChain %249 %86 
                                f32 %311 = OpLoad %310 
                                f32 %312 = OpFAdd %309 %311 
                       Private f32* %313 = OpAccessChain %249 %86 
                                             OpStore %313 %312 
                read_only Texture2D %314 = OpLoad %54 
                            sampler %315 = OpLoad %58 
         read_only Texture2DSampled %316 = OpSampledImage %314 %315 
                              f32_4 %317 = OpLoad %22 
                              f32_2 %318 = OpVectorShuffle %317 %317 2 3 
                              f32_4 %319 = OpImageSampleImplicitLod %316 %318 
                              f32_3 %320 = OpVectorShuffle %319 %319 0 1 2 
                              f32_4 %321 = OpLoad %22 
                              f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                             OpStore %22 %322 
                       Private f32* %324 = OpAccessChain %249 %295 
                                f32 %325 = OpLoad %324 
                                f32 %327 = OpFMul %325 %326 
                                             OpStore %323 %327 
                                f32 %328 = OpLoad %323 
                                f32 %329 = OpExtInst %1 8 %328 
                                             OpStore %323 %329 
                                f32 %330 = OpLoad %323 
                                f32 %331 = OpFNegate %330 
                                f32 %333 = OpFMul %331 %332 
                       Private f32* %334 = OpAccessChain %249 %295 
                                f32 %335 = OpLoad %334 
                                f32 %336 = OpFAdd %333 %335 
                                             OpStore %323 %336 
                       Uniform f32* %341 = OpAccessChain %14 %340 
                                f32 %342 = OpLoad %341 
                                f32 %343 = OpLoad %323 
                               bool %344 = OpFOrdGreaterThanEqual %342 %343 
                                             OpStore %339 %344 
                       Private f32* %346 = OpAccessChain %22 %302 
                                f32 %347 = OpLoad %346 
                       Private f32* %348 = OpAccessChain %22 %86 
                                f32 %349 = OpLoad %348 
                                f32 %350 = OpExtInst %1 37 %347 %349 
                                             OpStore %345 %350 
                       Private f32* %351 = OpAccessChain %22 %295 
                                f32 %352 = OpLoad %351 
                                f32 %353 = OpLoad %345 
                                f32 %354 = OpExtInst %1 37 %352 %353 
                                             OpStore %345 %354 
                       Private f32* %355 = OpAccessChain %22 %302 
                                f32 %356 = OpLoad %355 
                       Private f32* %357 = OpAccessChain %22 %86 
                                f32 %358 = OpLoad %357 
                                f32 %359 = OpExtInst %1 40 %356 %358 
                       Private f32* %360 = OpAccessChain %37 %86 
                                             OpStore %360 %359 
                       Private f32* %361 = OpAccessChain %22 %295 
                                f32 %362 = OpLoad %361 
                       Private f32* %363 = OpAccessChain %37 %86 
                                f32 %364 = OpLoad %363 
                                f32 %365 = OpExtInst %1 40 %362 %364 
                       Private f32* %366 = OpAccessChain %37 %86 
                                             OpStore %366 %365 
                                f32 %367 = OpLoad %345 
                                f32 %368 = OpFNegate %367 
                       Private f32* %369 = OpAccessChain %37 %86 
                                f32 %370 = OpLoad %369 
                                f32 %371 = OpFAdd %368 %370 
                                             OpStore %345 %371 
                       Private f32* %372 = OpAccessChain %37 %86 
                                f32 %373 = OpLoad %372 
                                f32 %374 = OpFDiv %10 %373 
                       Private f32* %375 = OpAccessChain %37 %86 
                                             OpStore %375 %374 
                              f32_4 %376 = OpLoad %22 
                              f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                              f32_4 %378 = OpLoad %37 
                              f32_3 %379 = OpVectorShuffle %378 %378 0 0 0 
                              f32_3 %380 = OpFMul %377 %379 
                              f32_4 %381 = OpLoad %37 
                              f32_4 %382 = OpVectorShuffle %381 %380 4 5 6 3 
                                             OpStore %37 %382 
                              f32_4 %383 = OpLoad %22 
                              f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                f32 %385 = OpDot %384 %83 
                       Private f32* %386 = OpAccessChain %22 %86 
                                             OpStore %386 %385 
                              f32_4 %390 = OpLoad %22 
                              f32_4 %391 = OpVectorShuffle %390 %390 0 0 0 0 
                             bool_4 %397 = OpFOrdLessThan %391 %396 
                                             OpStore %389 %397 
                                f32 %399 = OpLoad %345 
                               bool %400 = OpFOrdLessThan %326 %399 
                                             OpStore %398 %400 
                               bool %401 = OpLoad %398 
                                             OpSelectionMerge %405 None 
                                             OpBranchConditional %401 %404 %408 
                                    %404 = OpLabel 
                              f32_4 %406 = OpLoad %37 
                              f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
                                             OpStore %403 %407 
                                             OpBranch %405 
                                    %408 = OpLabel 
                                             OpStore %403 %409 
                                             OpBranch %405 
                                    %405 = OpLabel 
                              f32_3 %410 = OpLoad %403 
                              f32_4 %411 = OpLoad %22 
                              f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
                                             OpStore %22 %412 
                              f32_4 %413 = OpLoad %22 
                              f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
                              f32_3 %416 = OpFMul %414 %415 
                              f32_4 %417 = OpLoad %37 
                              f32_4 %418 = OpVectorShuffle %417 %416 4 5 6 3 
                                             OpStore %37 %418 
                       Private f32* %419 = OpAccessChain %249 %86 
                                f32 %420 = OpLoad %419 
                                f32 %421 = OpFMul %420 %326 
                                             OpStore %345 %421 
                                f32 %422 = OpLoad %345 
                                f32 %423 = OpExtInst %1 8 %422 
                                             OpStore %345 %423 
                                f32 %424 = OpLoad %345 
                                f32 %425 = OpFNegate %424 
                                f32 %426 = OpFMul %425 %332 
                       Private f32* %427 = OpAccessChain %249 %86 
                                f32 %428 = OpLoad %427 
                                f32 %429 = OpFAdd %426 %428 
                                             OpStore %345 %429 
                              f32_3 %430 = OpLoad %249 
                              f32_2 %431 = OpVectorShuffle %430 %430 0 2 
                              f32_2 %434 = OpFAdd %431 %433 
                              f32_3 %435 = OpLoad %249 
                              f32_3 %436 = OpVectorShuffle %435 %434 3 1 4 
                                             OpStore %249 %436 
                       Uniform f32* %438 = OpAccessChain %14 %340 
                                f32 %439 = OpLoad %438 
                                f32 %440 = OpLoad %345 
                               bool %441 = OpFOrdGreaterThanEqual %439 %440 
                                             OpStore %437 %441 
                               bool %442 = OpLoad %437 
                                             OpSelectionMerge %445 None 
                                             OpBranchConditional %442 %444 %448 
                                    %444 = OpLabel 
                              f32_4 %446 = OpLoad %37 
                              f32_3 %447 = OpVectorShuffle %446 %446 0 1 2 
                                             OpStore %443 %447 
                                             OpBranch %445 
                                    %448 = OpLabel 
                                             OpStore %443 %409 
                                             OpBranch %445 
                                    %445 = OpLabel 
                              f32_3 %449 = OpLoad %443 
                              f32_4 %450 = OpLoad %37 
                              f32_4 %451 = OpVectorShuffle %450 %449 4 5 6 3 
                                             OpStore %37 %451 
                      Private bool* %452 = OpAccessChain %389 %86 
                               bool %453 = OpLoad %452 
                                             OpSelectionMerge %456 None 
                                             OpBranchConditional %453 %455 %459 
                                    %455 = OpLabel 
                              f32_4 %457 = OpLoad %37 
                              f32_3 %458 = OpVectorShuffle %457 %457 0 1 2 
                                             OpStore %454 %458 
                                             OpBranch %456 
                                    %459 = OpLabel 
                                             OpStore %454 %409 
                                             OpBranch %456 
                                    %456 = OpLabel 
                              f32_3 %460 = OpLoad %454 
                              f32_4 %461 = OpLoad %37 
                              f32_4 %462 = OpVectorShuffle %461 %460 4 5 6 3 
                                             OpStore %37 %462 
                              f32_4 %463 = OpLoad %22 
                              f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
                              f32_3 %466 = OpFMul %464 %465 
                              f32_4 %467 = OpLoad %106 
                              f32_4 %468 = OpVectorShuffle %467 %466 4 5 6 3 
                                             OpStore %106 %468 
                              f32_4 %469 = OpLoad %22 
                              f32_3 %470 = OpVectorShuffle %469 %469 0 1 2 
                              f32_3 %472 = OpFMul %470 %471 
                              f32_4 %473 = OpLoad %22 
                              f32_4 %474 = OpVectorShuffle %473 %472 4 5 6 3 
                                             OpStore %22 %474 
                               bool %475 = OpLoad %339 
                                             OpSelectionMerge %478 None 
                                             OpBranchConditional %475 %477 %481 
                                    %477 = OpLabel 
                              f32_4 %479 = OpLoad %106 
                              f32_3 %480 = OpVectorShuffle %479 %479 0 1 2 
                                             OpStore %476 %480 
                                             OpBranch %478 
                                    %481 = OpLabel 
                              f32_4 %482 = OpLoad %37 
                              f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                             OpStore %476 %483 
                                             OpBranch %478 
                                    %478 = OpLabel 
                              f32_3 %484 = OpLoad %476 
                              f32_4 %485 = OpLoad %106 
                              f32_4 %486 = OpVectorShuffle %485 %484 4 5 6 3 
                                             OpStore %106 %486 
                      Private bool* %487 = OpAccessChain %389 %302 
                               bool %488 = OpLoad %487 
                                             OpSelectionMerge %491 None 
                                             OpBranchConditional %488 %490 %494 
                                    %490 = OpLabel 
                              f32_4 %492 = OpLoad %106 
                              f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
                                             OpStore %489 %493 
                                             OpBranch %491 
                                    %494 = OpLabel 
                              f32_4 %495 = OpLoad %37 
                              f32_3 %496 = OpVectorShuffle %495 %495 0 1 2 
                                             OpStore %489 %496 
                                             OpBranch %491 
                                    %491 = OpLabel 
                              f32_3 %497 = OpLoad %489 
                              f32_4 %498 = OpLoad %37 
                              f32_4 %499 = OpVectorShuffle %498 %497 4 5 6 3 
                                             OpStore %37 %499 
                       Private f32* %500 = OpAccessChain %249 %86 
                                f32 %501 = OpLoad %500 
                                f32 %502 = OpFMul %501 %326 
                                             OpStore %323 %502 
                                f32 %503 = OpLoad %323 
                                f32 %504 = OpExtInst %1 8 %503 
                                             OpStore %323 %504 
                                f32 %505 = OpLoad %323 
                                f32 %506 = OpFNegate %505 
                                f32 %507 = OpFMul %506 %332 
                       Private f32* %508 = OpAccessChain %249 %86 
                                f32 %509 = OpLoad %508 
                                f32 %510 = OpFAdd %507 %509 
                       Private f32* %511 = OpAccessChain %249 %86 
                                             OpStore %511 %510 
                       Uniform f32* %513 = OpAccessChain %14 %340 
                                f32 %514 = OpLoad %513 
                       Private f32* %515 = OpAccessChain %249 %86 
                                f32 %516 = OpLoad %515 
                               bool %517 = OpFOrdGreaterThanEqual %514 %516 
                                             OpStore %512 %517 
                               bool %518 = OpLoad %512 
                                             OpSelectionMerge %521 None 
                                             OpBranchConditional %518 %520 %524 
                                    %520 = OpLabel 
                              f32_4 %522 = OpLoad %22 
                              f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
                                             OpStore %519 %523 
                                             OpBranch %521 
                                    %524 = OpLabel 
                              f32_4 %525 = OpLoad %37 
                              f32_3 %526 = OpVectorShuffle %525 %525 0 1 2 
                                             OpStore %519 %526 
                                             OpBranch %521 
                                    %521 = OpLabel 
                              f32_3 %527 = OpLoad %519 
                              f32_4 %528 = OpLoad %22 
                              f32_4 %529 = OpVectorShuffle %528 %527 4 5 6 3 
                                             OpStore %22 %529 
                      Private bool* %530 = OpAccessChain %389 %295 
                               bool %531 = OpLoad %530 
                                             OpSelectionMerge %534 None 
                                             OpBranchConditional %531 %533 %537 
                                    %533 = OpLabel 
                              f32_4 %535 = OpLoad %22 
                              f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                             OpStore %532 %536 
                                             OpBranch %534 
                                    %537 = OpLabel 
                              f32_4 %538 = OpLoad %37 
                              f32_3 %539 = OpVectorShuffle %538 %538 0 1 2 
                                             OpStore %532 %539 
                                             OpBranch %534 
                                    %534 = OpLabel 
                              f32_3 %540 = OpLoad %532 
                              f32_4 %541 = OpLoad %22 
                              f32_4 %542 = OpVectorShuffle %541 %540 4 5 6 3 
                                             OpStore %22 %542 
                       Private f32* %543 = OpAccessChain %249 %295 
                                f32 %544 = OpLoad %543 
                                f32 %545 = OpFMul %544 %326 
                       Private f32* %546 = OpAccessChain %249 %86 
                                             OpStore %546 %545 
                       Private f32* %547 = OpAccessChain %249 %86 
                                f32 %548 = OpLoad %547 
                                f32 %549 = OpExtInst %1 8 %548 
                       Private f32* %550 = OpAccessChain %249 %86 
                                             OpStore %550 %549 
                       Private f32* %551 = OpAccessChain %249 %86 
                                f32 %552 = OpLoad %551 
                                f32 %553 = OpFNegate %552 
                                f32 %554 = OpFMul %553 %332 
                       Private f32* %555 = OpAccessChain %249 %295 
                                f32 %556 = OpLoad %555 
                                f32 %557 = OpFAdd %554 %556 
                       Private f32* %558 = OpAccessChain %249 %86 
                                             OpStore %558 %557 
                       Uniform f32* %559 = OpAccessChain %14 %340 
                                f32 %560 = OpLoad %559 
                       Private f32* %561 = OpAccessChain %249 %86 
                                f32 %562 = OpLoad %561 
                               bool %563 = OpFOrdGreaterThanEqual %560 %562 
                                             OpStore %512 %563 
                               bool %564 = OpLoad %512 
                                             OpSelectionMerge %567 None 
                                             OpBranchConditional %564 %566 %569 
                                    %566 = OpLabel 
                                             OpStore %565 %568 
                                             OpBranch %567 
                                    %569 = OpLabel 
                              f32_4 %570 = OpLoad %22 
                              f32_3 %571 = OpVectorShuffle %570 %570 0 1 2 
                                             OpStore %565 %571 
                                             OpBranch %567 
                                    %567 = OpLabel 
                              f32_3 %572 = OpLoad %565 
                                             OpStore %249 %572 
                      Private bool* %574 = OpAccessChain %389 %573 
                               bool %575 = OpLoad %574 
                                             OpSelectionMerge %578 None 
                                             OpBranchConditional %575 %577 %580 
                                    %577 = OpLabel 
                              f32_3 %579 = OpLoad %249 
                                             OpStore %576 %579 
                                             OpBranch %578 
                                    %580 = OpLabel 
                              f32_4 %581 = OpLoad %22 
                              f32_3 %582 = OpVectorShuffle %581 %581 0 1 2 
                                             OpStore %576 %582 
                                             OpBranch %578 
                                    %578 = OpLabel 
                              f32_3 %583 = OpLoad %576 
                                             OpStore %249 %583 
                              f32_4 %586 = OpLoad %9 
                              f32_3 %587 = OpVectorShuffle %586 %586 0 0 0 
                              f32_3 %588 = OpLoad %249 
                              f32_3 %589 = OpFMul %587 %588 
                              f32_4 %590 = OpLoad %585 
                              f32_4 %591 = OpVectorShuffle %590 %589 4 5 6 3 
                                             OpStore %585 %591 
                        Output f32* %593 = OpAccessChain %585 %573 
                                             OpStore %593 %10 
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