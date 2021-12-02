//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Antialiasing_FXAA" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  GpuProgramID 60793
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat7;
vec2 u_xlat8;
vec2 u_xlat12;
vec2 u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
    u_xlat1.xy = (-u_xlat12.xy) + u_xlat0.xy;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2 = u_xlat12.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat4.xy = u_xlat12.xy + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat4.xy);
    u_xlat5 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.y = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.z = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.w = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.x = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat8.xy = min(u_xlat1.yw, u_xlat1.xz);
    u_xlat8.x = min(u_xlat8.y, u_xlat8.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat2.x);
    u_xlat14.xy = max(u_xlat1.yw, u_xlat1.xz);
    u_xlat14.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat2.x = max(u_xlat14.x, u_xlat2.x);
    u_xlat14.xy = u_xlat1.yw + u_xlat1.xz;
    u_xlat20 = (-u_xlat14.y) + u_xlat14.x;
    u_xlat3.x = (-u_xlat20);
    u_xlat1.xy = u_xlat1.zw + u_xlat1.xy;
    u_xlat3.y = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.z + u_xlat14.x;
    u_xlat1.x = u_xlat1.w + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.03125;
    u_xlat1.x = max(u_xlat1.x, 0.0078125);
    u_xlat7 = min(abs(u_xlat20), abs(u_xlat3.y));
    u_xlat1.x = u_xlat1.x + u_xlat7;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.xy = u_xlat1.xx * u_xlat3.xy;
    u_xlat1.xy = max(u_xlat1.xy, vec2(-8.0, -8.0));
    u_xlat1.xy = min(u_xlat1.xy, vec2(8.0, 8.0));
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
    u_xlat1 = u_xlat12.xyxy * vec4(-0.165999994, -0.165999994, -0.5, -0.5) + u_xlat0.xyxy;
    u_xlat3 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0.xy = u_xlat12.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlatb1 = u_xlat18<u_xlat8.x;
    u_xlatb18 = u_xlat2.x<u_xlat18;
    u_xlatb18 = u_xlatb18 || u_xlatb1;
    if(u_xlatb18){
        SV_Target0.xyz = u_xlat3.xyz;
        SV_Target0.w = 1.0;
        return;
    } else {
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
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
; Bound: 358
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %344 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %55 DescriptorSet 55 
                                             OpDecorate %55 Binding 55 
                                             OpDecorate %344 Location 344 
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
                                     %15 = OpTypeStruct %14 %14 
                                     %16 = OpTypePointer Uniform %15 
     Uniform struct {f32_4; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 1 
                                     %20 = OpTypePointer Uniform %14 
                                     %31 = OpTypePointer Private %10 
                      Private f32_2* %32 = OpVariable Private 
                                 f32 %33 = OpConstant 3.674022E-40 
                               f32_2 %34 = OpConstantComposite %33 %33 
                                 i32 %35 = OpConstant 0 
                                     %40 = OpTypePointer Private %14 
                      Private f32_4* %41 = OpVariable Private 
                                     %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %50 = OpTypePointer UniformConstant %49 
UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                     %53 = OpTypeSampler 
                                     %54 = OpTypePointer UniformConstant %53 
            UniformConstant sampler* %55 = OpVariable UniformConstant 
                                     %57 = OpTypeSampledImage %49 
                      Private f32_4* %65 = OpVariable Private 
                                 f32 %68 = OpConstant 3.674022E-40 
                               f32_4 %69 = OpConstantComposite %33 %68 %68 %33 
                      Private f32_3* %74 = OpVariable Private 
                      Private f32_3* %91 = OpVariable Private 
                     Private f32_3* %105 = OpVariable Private 
                                f32 %115 = OpConstant 3.674022E-40 
                                f32 %116 = OpConstant 3.674022E-40 
                                f32 %117 = OpConstant 3.674022E-40 
                              f32_3 %118 = OpConstantComposite %115 %116 %117 
                                    %120 = OpTypeInt 32 0 
                                u32 %121 = OpConstant 0 
                                    %122 = OpTypePointer Private %6 
                                u32 %126 = OpConstant 1 
                                u32 %131 = OpConstant 2 
                                u32 %135 = OpConstant 3 
                     Private f32_2* %140 = OpVariable Private 
                     Private f32_2* %158 = OpVariable Private 
                       Private f32* %181 = OpVariable Private 
                                f32 %219 = OpConstant 3.674022E-40 
                                f32 %224 = OpConstant 3.674022E-40 
                       Private f32* %227 = OpVariable Private 
                                f32 %252 = OpConstant 3.674022E-40 
                              f32_2 %253 = OpConstantComposite %252 %252 
                                f32 %259 = OpConstant 3.674022E-40 
                              f32_2 %260 = OpConstantComposite %259 %259 
                                f32 %270 = OpConstant 3.674022E-40 
                                f32 %271 = OpConstant 3.674022E-40 
                              f32_4 %272 = OpConstantComposite %270 %270 %271 %271 
                                f32 %294 = OpConstant 3.674022E-40 
                              f32_2 %295 = OpConstantComposite %294 %294 
                                f32 %314 = OpConstant 3.674022E-40 
                              f32_3 %315 = OpConstantComposite %314 %314 %314 
                              f32_3 %318 = OpConstantComposite %294 %294 %294 
                       Private f32* %322 = OpVariable Private 
                                    %325 = OpTypeBool 
                                    %326 = OpTypePointer Private %325 
                      Private bool* %327 = OpVariable Private 
                      Private bool* %332 = OpVariable Private 
                                    %343 = OpTypePointer Output %14 
                      Output f32_4* %344 = OpVariable Output 
                                    %348 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
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
                      Uniform f32_4* %36 = OpAccessChain %17 %35 
                               f32_4 %37 = OpLoad %36 
                               f32_2 %38 = OpVectorShuffle %37 %37 0 1 
                               f32_2 %39 = OpFDiv %34 %38 
                                             OpStore %32 %39 
                               f32_2 %42 = OpLoad %32 
                               f32_2 %43 = OpFNegate %42 
                               f32_3 %44 = OpLoad %9 
                               f32_2 %45 = OpVectorShuffle %44 %44 0 1 
                               f32_2 %46 = OpFAdd %43 %45 
                               f32_4 %47 = OpLoad %41 
                               f32_4 %48 = OpVectorShuffle %47 %46 4 5 2 3 
                                             OpStore %41 %48 
                 read_only Texture2D %52 = OpLoad %51 
                             sampler %56 = OpLoad %55 
          read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                               f32_4 %59 = OpLoad %41 
                               f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                               f32_4 %61 = OpImageSampleImplicitLod %58 %60 
                               f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                               f32_4 %63 = OpLoad %41 
                               f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                             OpStore %41 %64 
                               f32_2 %66 = OpLoad %32 
                               f32_4 %67 = OpVectorShuffle %66 %66 0 1 0 1 
                               f32_4 %70 = OpFMul %67 %69 
                               f32_3 %71 = OpLoad %9 
                               f32_4 %72 = OpVectorShuffle %71 %71 0 1 0 1 
                               f32_4 %73 = OpFAdd %70 %72 
                                             OpStore %65 %73 
                 read_only Texture2D %75 = OpLoad %51 
                             sampler %76 = OpLoad %55 
          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
                               f32_4 %78 = OpLoad %65 
                               f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                               f32_4 %80 = OpImageSampleImplicitLod %77 %79 
                               f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                             OpStore %74 %81 
                 read_only Texture2D %82 = OpLoad %51 
                             sampler %83 = OpLoad %55 
          read_only Texture2DSampled %84 = OpSampledImage %82 %83 
                               f32_4 %85 = OpLoad %65 
                               f32_2 %86 = OpVectorShuffle %85 %85 2 3 
                               f32_4 %87 = OpImageSampleImplicitLod %84 %86 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               f32_4 %89 = OpLoad %65 
                               f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                             OpStore %65 %90 
                               f32_2 %92 = OpLoad %32 
                               f32_3 %93 = OpLoad %9 
                               f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                               f32_2 %95 = OpFAdd %92 %94 
                               f32_3 %96 = OpLoad %91 
                               f32_3 %97 = OpVectorShuffle %96 %95 3 4 2 
                                             OpStore %91 %97 
                 read_only Texture2D %98 = OpLoad %51 
                             sampler %99 = OpLoad %55 
         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
                              f32_3 %101 = OpLoad %91 
                              f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                              f32_4 %103 = OpImageSampleImplicitLod %100 %102 
                              f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                             OpStore %91 %104 
                read_only Texture2D %106 = OpLoad %51 
                            sampler %107 = OpLoad %55 
         read_only Texture2DSampled %108 = OpSampledImage %106 %107 
                              f32_3 %109 = OpLoad %9 
                              f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                              f32_4 %111 = OpImageSampleImplicitLod %108 %110 
                              f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                             OpStore %105 %112 
                              f32_4 %113 = OpLoad %41 
                              f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                f32 %119 = OpDot %114 %118 
                       Private f32* %123 = OpAccessChain %41 %121 
                                             OpStore %123 %119 
                              f32_3 %124 = OpLoad %74 
                                f32 %125 = OpDot %124 %118 
                       Private f32* %127 = OpAccessChain %41 %126 
                                             OpStore %127 %125 
                              f32_4 %128 = OpLoad %65 
                              f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                f32 %130 = OpDot %129 %118 
                       Private f32* %132 = OpAccessChain %41 %131 
                                             OpStore %132 %130 
                              f32_3 %133 = OpLoad %91 
                                f32 %134 = OpDot %133 %118 
                       Private f32* %136 = OpAccessChain %41 %135 
                                             OpStore %136 %134 
                              f32_3 %137 = OpLoad %105 
                                f32 %138 = OpDot %137 %118 
                       Private f32* %139 = OpAccessChain %65 %121 
                                             OpStore %139 %138 
                              f32_4 %141 = OpLoad %41 
                              f32_2 %142 = OpVectorShuffle %141 %141 1 3 
                              f32_4 %143 = OpLoad %41 
                              f32_2 %144 = OpVectorShuffle %143 %143 0 2 
                              f32_2 %145 = OpExtInst %1 37 %142 %144 
                                             OpStore %140 %145 
                       Private f32* %146 = OpAccessChain %140 %126 
                                f32 %147 = OpLoad %146 
                       Private f32* %148 = OpAccessChain %140 %121 
                                f32 %149 = OpLoad %148 
                                f32 %150 = OpExtInst %1 37 %147 %149 
                       Private f32* %151 = OpAccessChain %140 %121 
                                             OpStore %151 %150 
                       Private f32* %152 = OpAccessChain %140 %121 
                                f32 %153 = OpLoad %152 
                       Private f32* %154 = OpAccessChain %65 %121 
                                f32 %155 = OpLoad %154 
                                f32 %156 = OpExtInst %1 37 %153 %155 
                       Private f32* %157 = OpAccessChain %140 %121 
                                             OpStore %157 %156 
                              f32_4 %159 = OpLoad %41 
                              f32_2 %160 = OpVectorShuffle %159 %159 1 3 
                              f32_4 %161 = OpLoad %41 
                              f32_2 %162 = OpVectorShuffle %161 %161 0 2 
                              f32_2 %163 = OpExtInst %1 40 %160 %162 
                                             OpStore %158 %163 
                       Private f32* %164 = OpAccessChain %158 %126 
                                f32 %165 = OpLoad %164 
                       Private f32* %166 = OpAccessChain %158 %121 
                                f32 %167 = OpLoad %166 
                                f32 %168 = OpExtInst %1 40 %165 %167 
                       Private f32* %169 = OpAccessChain %158 %121 
                                             OpStore %169 %168 
                       Private f32* %170 = OpAccessChain %158 %121 
                                f32 %171 = OpLoad %170 
                       Private f32* %172 = OpAccessChain %65 %121 
                                f32 %173 = OpLoad %172 
                                f32 %174 = OpExtInst %1 40 %171 %173 
                       Private f32* %175 = OpAccessChain %65 %121 
                                             OpStore %175 %174 
                              f32_4 %176 = OpLoad %41 
                              f32_2 %177 = OpVectorShuffle %176 %176 1 3 
                              f32_4 %178 = OpLoad %41 
                              f32_2 %179 = OpVectorShuffle %178 %178 0 2 
                              f32_2 %180 = OpFAdd %177 %179 
                                             OpStore %158 %180 
                       Private f32* %182 = OpAccessChain %158 %126 
                                f32 %183 = OpLoad %182 
                                f32 %184 = OpFNegate %183 
                       Private f32* %185 = OpAccessChain %158 %121 
                                f32 %186 = OpLoad %185 
                                f32 %187 = OpFAdd %184 %186 
                                             OpStore %181 %187 
                                f32 %188 = OpLoad %181 
                                f32 %189 = OpFNegate %188 
                       Private f32* %190 = OpAccessChain %74 %121 
                                             OpStore %190 %189 
                              f32_4 %191 = OpLoad %41 
                              f32_2 %192 = OpVectorShuffle %191 %191 2 3 
                              f32_4 %193 = OpLoad %41 
                              f32_2 %194 = OpVectorShuffle %193 %193 0 1 
                              f32_2 %195 = OpFAdd %192 %194 
                              f32_4 %196 = OpLoad %41 
                              f32_4 %197 = OpVectorShuffle %196 %195 4 5 2 3 
                                             OpStore %41 %197 
                       Private f32* %198 = OpAccessChain %41 %126 
                                f32 %199 = OpLoad %198 
                                f32 %200 = OpFNegate %199 
                       Private f32* %201 = OpAccessChain %41 %121 
                                f32 %202 = OpLoad %201 
                                f32 %203 = OpFAdd %200 %202 
                       Private f32* %204 = OpAccessChain %74 %126 
                                             OpStore %204 %203 
                       Private f32* %205 = OpAccessChain %41 %131 
                                f32 %206 = OpLoad %205 
                       Private f32* %207 = OpAccessChain %158 %121 
                                f32 %208 = OpLoad %207 
                                f32 %209 = OpFAdd %206 %208 
                       Private f32* %210 = OpAccessChain %41 %121 
                                             OpStore %210 %209 
                       Private f32* %211 = OpAccessChain %41 %135 
                                f32 %212 = OpLoad %211 
                       Private f32* %213 = OpAccessChain %41 %121 
                                f32 %214 = OpLoad %213 
                                f32 %215 = OpFAdd %212 %214 
                       Private f32* %216 = OpAccessChain %41 %121 
                                             OpStore %216 %215 
                       Private f32* %217 = OpAccessChain %41 %121 
                                f32 %218 = OpLoad %217 
                                f32 %220 = OpFMul %218 %219 
                       Private f32* %221 = OpAccessChain %41 %121 
                                             OpStore %221 %220 
                       Private f32* %222 = OpAccessChain %41 %121 
                                f32 %223 = OpLoad %222 
                                f32 %225 = OpExtInst %1 40 %223 %224 
                       Private f32* %226 = OpAccessChain %41 %121 
                                             OpStore %226 %225 
                                f32 %228 = OpLoad %181 
                                f32 %229 = OpExtInst %1 4 %228 
                       Private f32* %230 = OpAccessChain %74 %126 
                                f32 %231 = OpLoad %230 
                                f32 %232 = OpExtInst %1 4 %231 
                                f32 %233 = OpExtInst %1 37 %229 %232 
                                             OpStore %227 %233 
                       Private f32* %234 = OpAccessChain %41 %121 
                                f32 %235 = OpLoad %234 
                                f32 %236 = OpLoad %227 
                                f32 %237 = OpFAdd %235 %236 
                       Private f32* %238 = OpAccessChain %41 %121 
                                             OpStore %238 %237 
                       Private f32* %239 = OpAccessChain %41 %121 
                                f32 %240 = OpLoad %239 
                                f32 %241 = OpFDiv %33 %240 
                       Private f32* %242 = OpAccessChain %41 %121 
                                             OpStore %242 %241 
                              f32_4 %243 = OpLoad %41 
                              f32_2 %244 = OpVectorShuffle %243 %243 0 0 
                              f32_3 %245 = OpLoad %74 
                              f32_2 %246 = OpVectorShuffle %245 %245 0 1 
                              f32_2 %247 = OpFMul %244 %246 
                              f32_4 %248 = OpLoad %41 
                              f32_4 %249 = OpVectorShuffle %248 %247 4 5 2 3 
                                             OpStore %41 %249 
                              f32_4 %250 = OpLoad %41 
                              f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                              f32_2 %254 = OpExtInst %1 40 %251 %253 
                              f32_4 %255 = OpLoad %41 
                              f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                             OpStore %41 %256 
                              f32_4 %257 = OpLoad %41 
                              f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                              f32_2 %261 = OpExtInst %1 37 %258 %260 
                              f32_4 %262 = OpLoad %41 
                              f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                             OpStore %41 %263 
                              f32_2 %264 = OpLoad %32 
                              f32_4 %265 = OpLoad %41 
                              f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                              f32_2 %267 = OpFMul %264 %266 
                                             OpStore %32 %267 
                              f32_2 %268 = OpLoad %32 
                              f32_4 %269 = OpVectorShuffle %268 %268 0 1 0 1 
                              f32_4 %273 = OpFMul %269 %272 
                              f32_3 %274 = OpLoad %9 
                              f32_4 %275 = OpVectorShuffle %274 %274 0 1 0 1 
                              f32_4 %276 = OpFAdd %273 %275 
                                             OpStore %41 %276 
                read_only Texture2D %277 = OpLoad %51 
                            sampler %278 = OpLoad %55 
         read_only Texture2DSampled %279 = OpSampledImage %277 %278 
                              f32_4 %280 = OpLoad %41 
                              f32_2 %281 = OpVectorShuffle %280 %280 0 1 
                              f32_4 %282 = OpImageSampleImplicitLod %279 %281 
                              f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                             OpStore %74 %283 
                read_only Texture2D %284 = OpLoad %51 
                            sampler %285 = OpLoad %55 
         read_only Texture2DSampled %286 = OpSampledImage %284 %285 
                              f32_4 %287 = OpLoad %41 
                              f32_2 %288 = OpVectorShuffle %287 %287 2 3 
                              f32_4 %289 = OpImageSampleImplicitLod %286 %288 
                              f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                              f32_4 %291 = OpLoad %41 
                              f32_4 %292 = OpVectorShuffle %291 %290 4 5 6 3 
                                             OpStore %41 %292 
                              f32_2 %293 = OpLoad %32 
                              f32_2 %296 = OpFMul %293 %295 
                              f32_3 %297 = OpLoad %9 
                              f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                              f32_2 %299 = OpFAdd %296 %298 
                              f32_3 %300 = OpLoad %9 
                              f32_3 %301 = OpVectorShuffle %300 %299 3 4 2 
                                             OpStore %9 %301 
                read_only Texture2D %302 = OpLoad %51 
                            sampler %303 = OpLoad %55 
         read_only Texture2DSampled %304 = OpSampledImage %302 %303 
                              f32_3 %305 = OpLoad %9 
                              f32_2 %306 = OpVectorShuffle %305 %305 0 1 
                              f32_4 %307 = OpImageSampleImplicitLod %304 %306 
                              f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                             OpStore %9 %308 
                              f32_3 %309 = OpLoad %9 
                              f32_4 %310 = OpLoad %41 
                              f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                              f32_3 %312 = OpFAdd %309 %311 
                                             OpStore %9 %312 
                              f32_3 %313 = OpLoad %9 
                              f32_3 %316 = OpFMul %313 %315 
                                             OpStore %9 %316 
                              f32_3 %317 = OpLoad %74 
                              f32_3 %319 = OpFMul %317 %318 
                              f32_3 %320 = OpLoad %9 
                              f32_3 %321 = OpFAdd %319 %320 
                                             OpStore %9 %321 
                              f32_3 %323 = OpLoad %9 
                                f32 %324 = OpDot %323 %118 
                                             OpStore %322 %324 
                                f32 %328 = OpLoad %322 
                       Private f32* %329 = OpAccessChain %140 %121 
                                f32 %330 = OpLoad %329 
                               bool %331 = OpFOrdLessThan %328 %330 
                                             OpStore %327 %331 
                       Private f32* %333 = OpAccessChain %65 %121 
                                f32 %334 = OpLoad %333 
                                f32 %335 = OpLoad %322 
                               bool %336 = OpFOrdLessThan %334 %335 
                                             OpStore %332 %336 
                               bool %337 = OpLoad %332 
                               bool %338 = OpLoad %327 
                               bool %339 = OpLogicalOr %337 %338 
                                             OpStore %332 %339 
                               bool %340 = OpLoad %332 
                                             OpSelectionMerge %342 None 
                                             OpBranchConditional %340 %341 %351 
                                    %341 = OpLabel 
                              f32_3 %345 = OpLoad %74 
                              f32_4 %346 = OpLoad %344 
                              f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
                                             OpStore %344 %347 
                        Output f32* %349 = OpAccessChain %344 %135 
                                             OpStore %349 %33 
                                             OpReturn
                                    %351 = OpLabel 
                              f32_3 %352 = OpLoad %9 
                              f32_4 %353 = OpLoad %344 
                              f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                             OpStore %344 %354 
                        Output f32* %355 = OpAccessChain %344 %135 
                                             OpStore %355 %33 
                                             OpReturn
                                    %342 = OpLabel 
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