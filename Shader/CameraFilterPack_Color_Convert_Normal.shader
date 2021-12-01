//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Color_Convert_Normal" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_ColorRGB ("_ColorRGB", Color) = (1,1,1,1)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49597
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
uniform 	float _Heigh;
uniform 	float _Intervale;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.y = _Intervale;
    u_xlat1.x = 0.0;
    u_xlat2 = u_xlat0.xyxy + u_xlat1.yxxy;
    u_xlat0 = u_xlat0.xyxy + (-u_xlat1.yxxy);
    u_xlat1 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat1.x = u_xlat1.z + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Heigh;
    u_xlat1.x = u_xlat1.x * 0.333333343;
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat12 = u_xlat3.y + u_xlat3.x;
    u_xlat12 = u_xlat3.z + u_xlat12;
    u_xlat12 = u_xlat12 * _Heigh;
    u_xlat0.w = u_xlat12 * 0.333333343 + (-u_xlat1.x);
    u_xlat1.x = _Intervale + _Intervale;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.z + u_xlat0.x;
    u_xlat4 = u_xlat2.y + u_xlat2.x;
    u_xlat0.y = u_xlat2.z + u_xlat4;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_Heigh, _Heigh));
    u_xlat4 = u_xlat0.y * 0.333333343;
    u_xlat0.x = u_xlat0.x * 0.333333343 + (-u_xlat4);
    u_xlat3.xy = u_xlat0.wx / u_xlat1.xx;
    u_xlat3.z = 1.0;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.z = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.zz * u_xlat3.xy;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
; Bound: 233
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %221 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %58 DescriptorSet 58 
                                             OpDecorate %58 Binding 58 
                                             OpDecorate %62 DescriptorSet 62 
                                             OpDecorate %62 Binding 62 
                                             OpDecorate %221 Location 221 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %14 = OpTypeStruct %6 %6 %7 
                                     %15 = OpTypePointer Uniform %14 
  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %7 
                                     %30 = OpTypeVector %6 3 
                                     %31 = OpTypePointer Private %30 
                      Private f32_3* %32 = OpVariable Private 
                                 i32 %33 = OpConstant 1 
                                     %34 = OpTypePointer Uniform %6 
                                     %37 = OpTypeInt 32 0 
                                 u32 %38 = OpConstant 1 
                                     %39 = OpTypePointer Private %6 
                                 f32 %41 = OpConstant 3.674022E-40 
                                 u32 %42 = OpConstant 0 
                      Private f32_4* %44 = OpVariable Private 
                                     %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %57 = OpTypePointer UniformConstant %56 
UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                     %60 = OpTypeSampler 
                                     %61 = OpTypePointer UniformConstant %60 
            UniformConstant sampler* %62 = OpVariable UniformConstant 
                                     %64 = OpTypeSampledImage %56 
                                 u32 %85 = OpConstant 2 
                                 i32 %94 = OpConstant 0 
                                f32 %101 = OpConstant 3.674022E-40 
                     Private f32_3* %104 = OpVariable Private 
                       Private f32* %121 = OpVariable Private 
                                u32 %141 = OpConstant 3 
                       Private f32* %161 = OpVariable Private 
                     Private f32_3* %195 = OpVariable Private 
                                f32 %203 = OpConstant 3.674022E-40 
                                    %220 = OpTypePointer Output %7 
                      Output f32_4* %221 = OpVariable Output 
                                f32 %224 = OpConstant 3.674022E-40 
                              f32_3 %225 = OpConstantComposite %224 %224 %224 
                                    %230 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %20 = OpAccessChain %16 %18 
                               f32_4 %21 = OpLoad %20 
                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                               f32_2 %23 = OpFMul %13 %22 
                      Uniform f32_4* %24 = OpAccessChain %16 %18 
                               f32_4 %25 = OpLoad %24 
                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                               f32_2 %27 = OpFAdd %23 %26 
                               f32_4 %28 = OpLoad %9 
                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                        Uniform f32* %35 = OpAccessChain %16 %33 
                                 f32 %36 = OpLoad %35 
                        Private f32* %40 = OpAccessChain %32 %38 
                                             OpStore %40 %36 
                        Private f32* %43 = OpAccessChain %32 %42 
                                             OpStore %43 %41 
                               f32_4 %45 = OpLoad %9 
                               f32_4 %46 = OpVectorShuffle %45 %45 0 1 0 1 
                               f32_3 %47 = OpLoad %32 
                               f32_4 %48 = OpVectorShuffle %47 %47 1 0 0 1 
                               f32_4 %49 = OpFAdd %46 %48 
                                             OpStore %44 %49 
                               f32_4 %50 = OpLoad %9 
                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 1 
                               f32_3 %52 = OpLoad %32 
                               f32_4 %53 = OpVectorShuffle %52 %52 1 0 0 1 
                               f32_4 %54 = OpFNegate %53 
                               f32_4 %55 = OpFAdd %51 %54 
                                             OpStore %9 %55 
                 read_only Texture2D %59 = OpLoad %58 
                             sampler %63 = OpLoad %62 
          read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                               f32_4 %66 = OpLoad %44 
                               f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                               f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
                                             OpStore %32 %69 
                 read_only Texture2D %70 = OpLoad %58 
                             sampler %71 = OpLoad %62 
          read_only Texture2DSampled %72 = OpSampledImage %70 %71 
                               f32_4 %73 = OpLoad %44 
                               f32_2 %74 = OpVectorShuffle %73 %73 2 3 
                               f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                               f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                               f32_4 %77 = OpLoad %44 
                               f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                             OpStore %44 %78 
                        Private f32* %79 = OpAccessChain %32 %38 
                                 f32 %80 = OpLoad %79 
                        Private f32* %81 = OpAccessChain %32 %42 
                                 f32 %82 = OpLoad %81 
                                 f32 %83 = OpFAdd %80 %82 
                        Private f32* %84 = OpAccessChain %32 %42 
                                             OpStore %84 %83 
                        Private f32* %86 = OpAccessChain %32 %85 
                                 f32 %87 = OpLoad %86 
                        Private f32* %88 = OpAccessChain %32 %42 
                                 f32 %89 = OpLoad %88 
                                 f32 %90 = OpFAdd %87 %89 
                        Private f32* %91 = OpAccessChain %32 %42 
                                             OpStore %91 %90 
                        Private f32* %92 = OpAccessChain %32 %42 
                                 f32 %93 = OpLoad %92 
                        Uniform f32* %95 = OpAccessChain %16 %94 
                                 f32 %96 = OpLoad %95 
                                 f32 %97 = OpFMul %93 %96 
                        Private f32* %98 = OpAccessChain %32 %42 
                                             OpStore %98 %97 
                        Private f32* %99 = OpAccessChain %32 %42 
                                f32 %100 = OpLoad %99 
                                f32 %102 = OpFMul %100 %101 
                       Private f32* %103 = OpAccessChain %32 %42 
                                             OpStore %103 %102 
                read_only Texture2D %105 = OpLoad %58 
                            sampler %106 = OpLoad %62 
         read_only Texture2DSampled %107 = OpSampledImage %105 %106 
                              f32_4 %108 = OpLoad %9 
                              f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                              f32_4 %110 = OpImageSampleImplicitLod %107 %109 
                              f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                             OpStore %104 %111 
                read_only Texture2D %112 = OpLoad %58 
                            sampler %113 = OpLoad %62 
         read_only Texture2DSampled %114 = OpSampledImage %112 %113 
                              f32_4 %115 = OpLoad %9 
                              f32_2 %116 = OpVectorShuffle %115 %115 2 3 
                              f32_4 %117 = OpImageSampleImplicitLod %114 %116 
                              f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                              f32_4 %119 = OpLoad %9 
                              f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                             OpStore %9 %120 
                       Private f32* %122 = OpAccessChain %104 %38 
                                f32 %123 = OpLoad %122 
                       Private f32* %124 = OpAccessChain %104 %42 
                                f32 %125 = OpLoad %124 
                                f32 %126 = OpFAdd %123 %125 
                                             OpStore %121 %126 
                       Private f32* %127 = OpAccessChain %104 %85 
                                f32 %128 = OpLoad %127 
                                f32 %129 = OpLoad %121 
                                f32 %130 = OpFAdd %128 %129 
                                             OpStore %121 %130 
                                f32 %131 = OpLoad %121 
                       Uniform f32* %132 = OpAccessChain %16 %94 
                                f32 %133 = OpLoad %132 
                                f32 %134 = OpFMul %131 %133 
                                             OpStore %121 %134 
                                f32 %135 = OpLoad %121 
                                f32 %136 = OpFMul %135 %101 
                       Private f32* %137 = OpAccessChain %32 %42 
                                f32 %138 = OpLoad %137 
                                f32 %139 = OpFNegate %138 
                                f32 %140 = OpFAdd %136 %139 
                       Private f32* %142 = OpAccessChain %9 %141 
                                             OpStore %142 %140 
                       Uniform f32* %143 = OpAccessChain %16 %33 
                                f32 %144 = OpLoad %143 
                       Uniform f32* %145 = OpAccessChain %16 %33 
                                f32 %146 = OpLoad %145 
                                f32 %147 = OpFAdd %144 %146 
                       Private f32* %148 = OpAccessChain %32 %42 
                                             OpStore %148 %147 
                       Private f32* %149 = OpAccessChain %9 %38 
                                f32 %150 = OpLoad %149 
                       Private f32* %151 = OpAccessChain %9 %42 
                                f32 %152 = OpLoad %151 
                                f32 %153 = OpFAdd %150 %152 
                       Private f32* %154 = OpAccessChain %9 %42 
                                             OpStore %154 %153 
                       Private f32* %155 = OpAccessChain %9 %85 
                                f32 %156 = OpLoad %155 
                       Private f32* %157 = OpAccessChain %9 %42 
                                f32 %158 = OpLoad %157 
                                f32 %159 = OpFAdd %156 %158 
                       Private f32* %160 = OpAccessChain %9 %42 
                                             OpStore %160 %159 
                       Private f32* %162 = OpAccessChain %44 %38 
                                f32 %163 = OpLoad %162 
                       Private f32* %164 = OpAccessChain %44 %42 
                                f32 %165 = OpLoad %164 
                                f32 %166 = OpFAdd %163 %165 
                                             OpStore %161 %166 
                       Private f32* %167 = OpAccessChain %44 %85 
                                f32 %168 = OpLoad %167 
                                f32 %169 = OpLoad %161 
                                f32 %170 = OpFAdd %168 %169 
                       Private f32* %171 = OpAccessChain %9 %38 
                                             OpStore %171 %170 
                              f32_4 %172 = OpLoad %9 
                              f32_2 %173 = OpVectorShuffle %172 %172 0 1 
                       Uniform f32* %174 = OpAccessChain %16 %94 
                                f32 %175 = OpLoad %174 
                       Uniform f32* %176 = OpAccessChain %16 %94 
                                f32 %177 = OpLoad %176 
                              f32_2 %178 = OpCompositeConstruct %175 %177 
                                f32 %179 = OpCompositeExtract %178 0 
                                f32 %180 = OpCompositeExtract %178 1 
                              f32_2 %181 = OpCompositeConstruct %179 %180 
                              f32_2 %182 = OpFMul %173 %181 
                              f32_4 %183 = OpLoad %9 
                              f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
                                             OpStore %9 %184 
                       Private f32* %185 = OpAccessChain %9 %38 
                                f32 %186 = OpLoad %185 
                                f32 %187 = OpFMul %186 %101 
                                             OpStore %161 %187 
                       Private f32* %188 = OpAccessChain %9 %42 
                                f32 %189 = OpLoad %188 
                                f32 %190 = OpFMul %189 %101 
                                f32 %191 = OpLoad %161 
                                f32 %192 = OpFNegate %191 
                                f32 %193 = OpFAdd %190 %192 
                       Private f32* %194 = OpAccessChain %9 %42 
                                             OpStore %194 %193 
                              f32_4 %196 = OpLoad %9 
                              f32_2 %197 = OpVectorShuffle %196 %196 3 0 
                              f32_3 %198 = OpLoad %32 
                              f32_2 %199 = OpVectorShuffle %198 %198 0 0 
                              f32_2 %200 = OpFDiv %197 %199 
                              f32_3 %201 = OpLoad %195 
                              f32_3 %202 = OpVectorShuffle %201 %200 3 4 2 
                                             OpStore %195 %202 
                       Private f32* %204 = OpAccessChain %195 %85 
                                             OpStore %204 %203 
                              f32_3 %205 = OpLoad %195 
                              f32_3 %206 = OpLoad %195 
                                f32 %207 = OpDot %205 %206 
                       Private f32* %208 = OpAccessChain %9 %42 
                                             OpStore %208 %207 
                       Private f32* %209 = OpAccessChain %9 %42 
                                f32 %210 = OpLoad %209 
                                f32 %211 = OpExtInst %1 32 %210 
                       Private f32* %212 = OpAccessChain %9 %85 
                                             OpStore %212 %211 
                              f32_4 %213 = OpLoad %9 
                              f32_2 %214 = OpVectorShuffle %213 %213 2 2 
                              f32_3 %215 = OpLoad %195 
                              f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                              f32_2 %217 = OpFMul %214 %216 
                              f32_4 %218 = OpLoad %9 
                              f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                             OpStore %9 %219 
                              f32_4 %222 = OpLoad %9 
                              f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                              f32_3 %226 = OpFMul %223 %225 
                              f32_3 %227 = OpFAdd %226 %225 
                              f32_4 %228 = OpLoad %221 
                              f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                             OpStore %221 %229 
                        Output f32* %231 = OpAccessChain %221 %141 
                                             OpStore %231 %203 
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