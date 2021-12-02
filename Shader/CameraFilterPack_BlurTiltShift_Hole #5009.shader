//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/BlurTiltShift_Hole" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Blurred (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Amount ("_Amount", Range(0, 20)) = 5
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 8336
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
uniform 	vec4 _ScreenParams;
uniform 	float _Amount;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3 = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
    u_xlat3 = _Amount / _ScreenParams.x;
    u_xlat0.y = u_xlat0.x * u_xlat3;
    u_xlat0.x = 0.0;
    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat6.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %150 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %118 DescriptorSet 118 
                                                      OpDecorate %118 Binding 118 
                                                      OpDecorate %122 DescriptorSet 122 
                                                      OpDecorate %122 Binding 122 
                                                      OpDecorate %150 Location 150 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeStruct %15 %6 %6 %6 %6 %6 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32; f32; f32; f32; f32;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 4 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 5 
                                              %36 = OpTypeInt 32 0 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          i32 %46 = OpConstant 3 
                                 Private f32* %52 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          i32 %54 = OpConstant 2 
                                          f32 %66 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          i32 %88 = OpConstant 1 
                                          i32 %91 = OpConstant 0 
                                          u32 %99 = OpConstant 1 
                                             %102 = OpTypePointer Private %10 
                              Private f32_2* %103 = OpVariable Private 
                              Private f32_3* %115 = OpVariable Private 
                                             %116 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %117 = OpTypePointer UniformConstant %116 
        UniformConstant read_only Texture2D* %118 = OpVariable UniformConstant 
                                             %120 = OpTypeSampler 
                                             %121 = OpTypePointer UniformConstant %120 
                    UniformConstant sampler* %122 = OpVariable UniformConstant 
                                             %124 = OpTypeSampledImage %116 
                              Private f32_3* %136 = OpVariable Private 
                                             %149 = OpTypePointer Output %15 
                               Output f32_4* %150 = OpVariable Output 
                                         f32 %152 = OpConstant 3.674022E-40 
                                       f32_3 %153 = OpConstantComposite %152 %152 %152 
                                         u32 %157 = OpConstant 3 
                                             %158 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_2 %14 = OpFNegate %13 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %18 %24 
                                          f32 %26 = OpLoad %25 
                                        f32_2 %27 = OpCompositeConstruct %23 %26 
                                        f32_2 %28 = OpFAdd %14 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                          f32 %35 = OpDot %32 %34 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %35 
                                 Private f32* %40 = OpAccessChain %9 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpExtInst %1 31 %41 
                                 Private f32* %43 = OpAccessChain %9 %37 
                                                      OpStore %43 %42 
                                 Private f32* %44 = OpAccessChain %9 %37 
                                          f32 %45 = OpLoad %44 
                                 Uniform f32* %47 = OpAccessChain %18 %46 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFNegate %48 
                                          f32 %50 = OpFAdd %45 %49 
                                 Private f32* %51 = OpAccessChain %9 %37 
                                                      OpStore %51 %50 
                                 Uniform f32* %55 = OpAccessChain %18 %54 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFNegate %56 
                                          f32 %58 = OpFDiv %53 %57 
                                                      OpStore %52 %58 
                                          f32 %59 = OpLoad %52 
                                 Private f32* %60 = OpAccessChain %9 %37 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFMul %59 %61 
                                 Private f32* %63 = OpAccessChain %9 %37 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %9 %37 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpExtInst %1 43 %65 %66 %53 
                                 Private f32* %68 = OpAccessChain %9 %37 
                                                      OpStore %68 %67 
                                 Private f32* %69 = OpAccessChain %9 %37 
                                          f32 %70 = OpLoad %69 
                                          f32 %72 = OpFMul %70 %71 
                                          f32 %74 = OpFAdd %72 %73 
                                                      OpStore %52 %74 
                                 Private f32* %75 = OpAccessChain %9 %37 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %77 = OpAccessChain %9 %37 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFMul %76 %78 
                                 Private f32* %80 = OpAccessChain %9 %37 
                                                      OpStore %80 %79 
                                          f32 %81 = OpLoad %52 
                                          f32 %82 = OpFNegate %81 
                                 Private f32* %83 = OpAccessChain %9 %37 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFMul %82 %84 
                                          f32 %86 = OpFAdd %85 %53 
                                 Private f32* %87 = OpAccessChain %9 %37 
                                                      OpStore %87 %86 
                                 Uniform f32* %89 = OpAccessChain %18 %88 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %92 = OpAccessChain %18 %91 %37 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpFDiv %90 %93 
                                                      OpStore %52 %94 
                                 Private f32* %95 = OpAccessChain %9 %37 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpLoad %52 
                                          f32 %98 = OpFMul %96 %97 
                                Private f32* %100 = OpAccessChain %9 %99 
                                                      OpStore %100 %98 
                                Private f32* %101 = OpAccessChain %9 %37 
                                                      OpStore %101 %66 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFNegate %105 
                                       f32_2 %107 = OpLoad vs_TEXCOORD0 
                                       f32_2 %108 = OpFAdd %106 %107 
                                                      OpStore %103 %108 
                                       f32_3 %109 = OpLoad %9 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %111 = OpLoad vs_TEXCOORD0 
                                       f32_2 %112 = OpFAdd %110 %111 
                                       f32_3 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %112 3 4 2 
                                                      OpStore %9 %114 
                         read_only Texture2D %119 = OpLoad %118 
                                     sampler %123 = OpLoad %122 
                  read_only Texture2DSampled %125 = OpSampledImage %119 %123 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_4 %128 = OpImageSampleImplicitLod %125 %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                                      OpStore %115 %129 
                         read_only Texture2D %130 = OpLoad %118 
                                     sampler %131 = OpLoad %122 
                  read_only Texture2DSampled %132 = OpSampledImage %130 %131 
                                       f32_2 %133 = OpLoad %103 
                                       f32_4 %134 = OpImageSampleImplicitLod %132 %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                                      OpStore %9 %135 
                         read_only Texture2D %137 = OpLoad %118 
                                     sampler %138 = OpLoad %122 
                  read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                                       f32_2 %140 = OpLoad vs_TEXCOORD0 
                                       f32_4 %141 = OpImageSampleImplicitLod %139 %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                                      OpStore %136 %142 
                                       f32_3 %143 = OpLoad %9 
                                       f32_3 %144 = OpLoad %136 
                                       f32_3 %145 = OpFAdd %143 %144 
                                                      OpStore %9 %145 
                                       f32_3 %146 = OpLoad %115 
                                       f32_3 %147 = OpLoad %9 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %9 %148 
                                       f32_3 %151 = OpLoad %9 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %150 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %150 %156 
                                 Output f32* %159 = OpAccessChain %150 %157 
                                                      OpStore %159 %53 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 130240
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
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.x) + _Value3;
    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value4;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3.x = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_MainTex2, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
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
; Bound: 135
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %122 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpMemberDecorate %18 2 Offset 18 
                                              OpMemberDecorate %18 3 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate %96 DescriptorSet 96 
                                              OpDecorate %96 Binding 96 
                                              OpDecorate %100 DescriptorSet 100 
                                              OpDecorate %100 Binding 100 
                                              OpDecorate %109 DescriptorSet 109 
                                              OpDecorate %109 Binding 109 
                                              OpDecorate %111 DescriptorSet 111 
                                              OpDecorate %111 Binding 111 
                                              OpDecorate %122 Location 122 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %12 = OpTypeInt 32 0 
                                  u32 %13 = OpConstant 0 
                                      %14 = OpTypePointer Input %6 
                                      %18 = OpTypeStruct %6 %6 %6 %6 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32; f32; f32; f32;}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 2 
                                      %23 = OpTypePointer Uniform %6 
                                      %27 = OpTypePointer Private %6 
                                  u32 %29 = OpConstant 1 
                                  i32 %33 = OpConstant 3 
                                  i32 %48 = OpConstant 1 
                                      %54 = OpTypeVector %6 3 
                                      %55 = OpTypePointer Private %54 
                       Private f32_3* %56 = OpVariable Private 
                                  f32 %57 = OpConstant 3.674022E-40 
                                  i32 %58 = OpConstant 0 
                                  f32 %72 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                  f32 %79 = OpConstant 3.674022E-40 
                                      %94 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %95 = OpTypePointer UniformConstant %94 
 UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                                      %98 = OpTypeSampler 
                                      %99 = OpTypePointer UniformConstant %98 
            UniformConstant sampler* %100 = OpVariable UniformConstant 
                                     %102 = OpTypeSampledImage %94 
                                     %105 = OpTypeVector %6 4 
                      Private f32_3* %108 = OpVariable Private 
UniformConstant read_only Texture2D* %109 = OpVariable UniformConstant 
            UniformConstant sampler* %111 = OpVariable UniformConstant 
                                     %121 = OpTypePointer Output %105 
                       Output f32_4* %122 = OpVariable Output 
                                 u32 %131 = OpConstant 3 
                                     %132 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                  f32 %16 = OpLoad %15 
                                  f32 %17 = OpFNegate %16 
                         Uniform f32* %24 = OpAccessChain %20 %22 
                                  f32 %25 = OpLoad %24 
                                  f32 %26 = OpFAdd %17 %25 
                         Private f32* %28 = OpAccessChain %9 %13 
                                              OpStore %28 %26 
                           Input f32* %30 = OpAccessChain vs_TEXCOORD0 %29 
                                  f32 %31 = OpLoad %30 
                                  f32 %32 = OpFNegate %31 
                         Uniform f32* %34 = OpAccessChain %20 %33 
                                  f32 %35 = OpLoad %34 
                                  f32 %36 = OpFAdd %32 %35 
                         Private f32* %37 = OpAccessChain %9 %29 
                                              OpStore %37 %36 
                                f32_2 %38 = OpLoad %9 
                                f32_2 %39 = OpLoad %9 
                                  f32 %40 = OpDot %38 %39 
                         Private f32* %41 = OpAccessChain %9 %13 
                                              OpStore %41 %40 
                         Private f32* %42 = OpAccessChain %9 %13 
                                  f32 %43 = OpLoad %42 
                                  f32 %44 = OpExtInst %1 31 %43 
                         Private f32* %45 = OpAccessChain %9 %13 
                                              OpStore %45 %44 
                         Private f32* %46 = OpAccessChain %9 %13 
                                  f32 %47 = OpLoad %46 
                         Uniform f32* %49 = OpAccessChain %20 %48 
                                  f32 %50 = OpLoad %49 
                                  f32 %51 = OpFNegate %50 
                                  f32 %52 = OpFAdd %47 %51 
                         Private f32* %53 = OpAccessChain %9 %13 
                                              OpStore %53 %52 
                         Uniform f32* %59 = OpAccessChain %20 %58 
                                  f32 %60 = OpLoad %59 
                                  f32 %61 = OpFNegate %60 
                                  f32 %62 = OpFDiv %57 %61 
                         Private f32* %63 = OpAccessChain %56 %13 
                                              OpStore %63 %62 
                         Private f32* %64 = OpAccessChain %56 %13 
                                  f32 %65 = OpLoad %64 
                         Private f32* %66 = OpAccessChain %9 %13 
                                  f32 %67 = OpLoad %66 
                                  f32 %68 = OpFMul %65 %67 
                         Private f32* %69 = OpAccessChain %9 %13 
                                              OpStore %69 %68 
                         Private f32* %70 = OpAccessChain %9 %13 
                                  f32 %71 = OpLoad %70 
                                  f32 %73 = OpExtInst %1 43 %71 %72 %57 
                         Private f32* %74 = OpAccessChain %9 %13 
                                              OpStore %74 %73 
                         Private f32* %75 = OpAccessChain %9 %13 
                                  f32 %76 = OpLoad %75 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %80 = OpFAdd %78 %79 
                         Private f32* %81 = OpAccessChain %56 %13 
                                              OpStore %81 %80 
                         Private f32* %82 = OpAccessChain %9 %13 
                                  f32 %83 = OpLoad %82 
                         Private f32* %84 = OpAccessChain %9 %13 
                                  f32 %85 = OpLoad %84 
                                  f32 %86 = OpFMul %83 %85 
                         Private f32* %87 = OpAccessChain %9 %13 
                                              OpStore %87 %86 
                         Private f32* %88 = OpAccessChain %9 %13 
                                  f32 %89 = OpLoad %88 
                         Private f32* %90 = OpAccessChain %56 %13 
                                  f32 %91 = OpLoad %90 
                                  f32 %92 = OpFMul %89 %91 
                         Private f32* %93 = OpAccessChain %9 %13 
                                              OpStore %93 %92 
                  read_only Texture2D %97 = OpLoad %96 
                             sampler %101 = OpLoad %100 
          read_only Texture2DSampled %103 = OpSampledImage %97 %101 
                               f32_2 %104 = OpLoad vs_TEXCOORD0 
                               f32_4 %106 = OpImageSampleImplicitLod %103 %104 
                               f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                              OpStore %56 %107 
                 read_only Texture2D %110 = OpLoad %109 
                             sampler %112 = OpLoad %111 
          read_only Texture2DSampled %113 = OpSampledImage %110 %112 
                               f32_2 %114 = OpLoad vs_TEXCOORD0 
                               f32_4 %115 = OpImageSampleImplicitLod %113 %114 
                               f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                              OpStore %108 %116 
                               f32_3 %117 = OpLoad %56 
                               f32_3 %118 = OpLoad %108 
                               f32_3 %119 = OpFNegate %118 
                               f32_3 %120 = OpFAdd %117 %119 
                                              OpStore %56 %120 
                               f32_2 %123 = OpLoad %9 
                               f32_3 %124 = OpVectorShuffle %123 %123 0 0 0 
                               f32_3 %125 = OpLoad %56 
                               f32_3 %126 = OpFMul %124 %125 
                               f32_3 %127 = OpLoad %108 
                               f32_3 %128 = OpFAdd %126 %127 
                               f32_4 %129 = OpLoad %122 
                               f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                              OpStore %122 %130 
                         Output f32* %133 = OpAccessChain %122 %131 
                                              OpStore %133 %57 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 154247
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
uniform 	vec4 _ScreenParams;
uniform 	float _Amount;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3 = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
    u_xlat3 = _Amount / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.y = 0.0;
    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat6.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %150 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %118 DescriptorSet 118 
                                                      OpDecorate %118 Binding 118 
                                                      OpDecorate %122 DescriptorSet 122 
                                                      OpDecorate %122 Binding 122 
                                                      OpDecorate %150 Location 150 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeStruct %15 %6 %6 %6 %6 %6 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32; f32; f32; f32; f32;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 4 
                                              %21 = OpTypePointer Uniform %6 
                                          i32 %24 = OpConstant 5 
                                              %36 = OpTypeInt 32 0 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          i32 %46 = OpConstant 3 
                                 Private f32* %52 = OpVariable Private 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          i32 %54 = OpConstant 2 
                                          f32 %66 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          i32 %88 = OpConstant 1 
                                          i32 %91 = OpConstant 0 
                                          u32 %92 = OpConstant 1 
                                             %102 = OpTypePointer Private %10 
                              Private f32_2* %103 = OpVariable Private 
                              Private f32_3* %115 = OpVariable Private 
                                             %116 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %117 = OpTypePointer UniformConstant %116 
        UniformConstant read_only Texture2D* %118 = OpVariable UniformConstant 
                                             %120 = OpTypeSampler 
                                             %121 = OpTypePointer UniformConstant %120 
                    UniformConstant sampler* %122 = OpVariable UniformConstant 
                                             %124 = OpTypeSampledImage %116 
                              Private f32_3* %136 = OpVariable Private 
                                             %149 = OpTypePointer Output %15 
                               Output f32_4* %150 = OpVariable Output 
                                         f32 %152 = OpConstant 3.674022E-40 
                                       f32_3 %153 = OpConstantComposite %152 %152 %152 
                                         u32 %157 = OpConstant 3 
                                             %158 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_2 %14 = OpFNegate %13 
                                 Uniform f32* %22 = OpAccessChain %18 %20 
                                          f32 %23 = OpLoad %22 
                                 Uniform f32* %25 = OpAccessChain %18 %24 
                                          f32 %26 = OpLoad %25 
                                        f32_2 %27 = OpCompositeConstruct %23 %26 
                                        f32_2 %28 = OpFAdd %14 %27 
                                        f32_3 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                      OpStore %9 %30 
                                        f32_3 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                        f32_3 %33 = OpLoad %9 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                          f32 %35 = OpDot %32 %34 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %35 
                                 Private f32* %40 = OpAccessChain %9 %37 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpExtInst %1 31 %41 
                                 Private f32* %43 = OpAccessChain %9 %37 
                                                      OpStore %43 %42 
                                 Private f32* %44 = OpAccessChain %9 %37 
                                          f32 %45 = OpLoad %44 
                                 Uniform f32* %47 = OpAccessChain %18 %46 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFNegate %48 
                                          f32 %50 = OpFAdd %45 %49 
                                 Private f32* %51 = OpAccessChain %9 %37 
                                                      OpStore %51 %50 
                                 Uniform f32* %55 = OpAccessChain %18 %54 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpFNegate %56 
                                          f32 %58 = OpFDiv %53 %57 
                                                      OpStore %52 %58 
                                          f32 %59 = OpLoad %52 
                                 Private f32* %60 = OpAccessChain %9 %37 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFMul %59 %61 
                                 Private f32* %63 = OpAccessChain %9 %37 
                                                      OpStore %63 %62 
                                 Private f32* %64 = OpAccessChain %9 %37 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpExtInst %1 43 %65 %66 %53 
                                 Private f32* %68 = OpAccessChain %9 %37 
                                                      OpStore %68 %67 
                                 Private f32* %69 = OpAccessChain %9 %37 
                                          f32 %70 = OpLoad %69 
                                          f32 %72 = OpFMul %70 %71 
                                          f32 %74 = OpFAdd %72 %73 
                                                      OpStore %52 %74 
                                 Private f32* %75 = OpAccessChain %9 %37 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %77 = OpAccessChain %9 %37 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFMul %76 %78 
                                 Private f32* %80 = OpAccessChain %9 %37 
                                                      OpStore %80 %79 
                                          f32 %81 = OpLoad %52 
                                          f32 %82 = OpFNegate %81 
                                 Private f32* %83 = OpAccessChain %9 %37 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFMul %82 %84 
                                          f32 %86 = OpFAdd %85 %53 
                                 Private f32* %87 = OpAccessChain %9 %37 
                                                      OpStore %87 %86 
                                 Uniform f32* %89 = OpAccessChain %18 %88 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %93 = OpAccessChain %18 %91 %92 
                                          f32 %94 = OpLoad %93 
                                          f32 %95 = OpFDiv %90 %94 
                                                      OpStore %52 %95 
                                 Private f32* %96 = OpAccessChain %9 %37 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpLoad %52 
                                          f32 %99 = OpFMul %97 %98 
                                Private f32* %100 = OpAccessChain %9 %37 
                                                      OpStore %100 %99 
                                Private f32* %101 = OpAccessChain %9 %92 
                                                      OpStore %101 %66 
                                       f32_3 %104 = OpLoad %9 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFNegate %105 
                                       f32_2 %107 = OpLoad vs_TEXCOORD0 
                                       f32_2 %108 = OpFAdd %106 %107 
                                                      OpStore %103 %108 
                                       f32_3 %109 = OpLoad %9 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_2 %111 = OpLoad vs_TEXCOORD0 
                                       f32_2 %112 = OpFAdd %110 %111 
                                       f32_3 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %112 3 4 2 
                                                      OpStore %9 %114 
                         read_only Texture2D %119 = OpLoad %118 
                                     sampler %123 = OpLoad %122 
                  read_only Texture2DSampled %125 = OpSampledImage %119 %123 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_4 %128 = OpImageSampleImplicitLod %125 %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                                      OpStore %115 %129 
                         read_only Texture2D %130 = OpLoad %118 
                                     sampler %131 = OpLoad %122 
                  read_only Texture2DSampled %132 = OpSampledImage %130 %131 
                                       f32_2 %133 = OpLoad %103 
                                       f32_4 %134 = OpImageSampleImplicitLod %132 %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                                      OpStore %9 %135 
                         read_only Texture2D %137 = OpLoad %118 
                                     sampler %138 = OpLoad %122 
                  read_only Texture2DSampled %139 = OpSampledImage %137 %138 
                                       f32_2 %140 = OpLoad vs_TEXCOORD0 
                                       f32_4 %141 = OpImageSampleImplicitLod %139 %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                                      OpStore %136 %142 
                                       f32_3 %143 = OpLoad %9 
                                       f32_3 %144 = OpLoad %136 
                                       f32_3 %145 = OpFAdd %143 %144 
                                                      OpStore %9 %145 
                                       f32_3 %146 = OpLoad %115 
                                       f32_3 %147 = OpLoad %9 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %9 %148 
                                       f32_3 %151 = OpLoad %9 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %150 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %150 %156 
                                 Output f32* %159 = OpAccessChain %150 %157 
                                                      OpStore %159 %53 
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