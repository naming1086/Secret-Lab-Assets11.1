//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Warp" {
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
  GpuProgramID 10556
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat4;
bool u_xlatb4;
float u_xlat6;
float u_xlat7;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(abs(u_xlat4.xy), abs(u_xlat4.xy));
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = (-_TimeX) * 0.333333343 + u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 5.0;
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat6 = u_xlat4.x * 99.9999924;
    u_xlatb4 = 0.00100000005>=u_xlat4.x;
    u_xlat1.x = sin(u_xlat6);
    u_xlat6 = u_xlat1.x / u_xlat6;
    u_xlat4.x = (u_xlatb4) ? 1.0 : abs(u_xlat6);
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value);
    u_xlat2.xyz = u_xlat4.xxx + (-u_xlat1.xyz);
    u_xlat7 = _Value + -0.0500000007;
    u_xlat7 = u_xlat7 + (-_Value2);
    u_xlat7 = u_xlat7 + (-_Value);
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat7) * u_xlat0.x + 1.0;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
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
; Bound: 206
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %11 %193 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 11 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %107 DescriptorSet 107 
                                                OpDecorate %107 Binding 107 
                                                OpDecorate %111 DescriptorSet 111 
                                                OpDecorate %111 Binding 111 
                                                OpDecorate %193 Location 193 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 2 
                                         %8 = OpTypePointer Private %7 
                          Private f32_2* %9 = OpVariable Private 
                                        %10 = OpTypePointer Input %7 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %13 = OpTypeVector %6 4 
                                        %14 = OpTypeStruct %6 %6 %6 %13 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %13 
                         Private f32_2* %28 = OpVariable Private 
                                    f32 %30 = OpConstant 3.674022E-40 
                                  f32_2 %31 = OpConstantComposite %30 %30 
                                        %38 = OpTypeInt 32 0 
                                    u32 %39 = OpConstant 0 
                                        %40 = OpTypePointer Private %6 
                                    i32 %46 = OpConstant 0 
                                        %47 = OpTypePointer Uniform %6 
                                    f32 %51 = OpConstant 3.674022E-40 
                                    f32 %59 = OpConstant 3.674022E-40 
                           Private f32* %72 = OpVariable Private 
                                    f32 %75 = OpConstant 3.674022E-40 
                                        %77 = OpTypeBool 
                                        %78 = OpTypePointer Private %77 
                          Private bool* %79 = OpVariable Private 
                                    f32 %80 = OpConstant 3.674022E-40 
                                        %84 = OpTypeVector %6 3 
                                        %85 = OpTypePointer Private %84 
                         Private f32_3* %86 = OpVariable Private 
                                        %95 = OpTypePointer Function %6 
                                    f32 %99 = OpConstant 3.674022E-40 
                                       %105 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %106 = OpTypePointer UniformConstant %105 
  UniformConstant read_only Texture2D* %107 = OpVariable UniformConstant 
                                       %109 = OpTypeSampler 
                                       %110 = OpTypePointer UniformConstant %109 
              UniformConstant sampler* %111 = OpVariable UniformConstant 
                                       %113 = OpTypeSampledImage %105 
                                   f32 %120 = OpConstant 3.674022E-40 
                                 f32_2 %121 = OpConstantComposite %120 %120 
                                   i32 %133 = OpConstant 1 
                        Private f32_3* %139 = OpVariable Private 
                          Private f32* %145 = OpVariable Private 
                                   f32 %148 = OpConstant 3.674022E-40 
                                   i32 %151 = OpConstant 2 
                                   f32 %170 = OpConstant 3.674022E-40 
                                   f32 %175 = OpConstant 3.674022E-40 
                                   f32 %177 = OpConstant 3.674022E-40 
                                       %192 = OpTypePointer Output %13 
                         Output f32_4* %193 = OpVariable Output 
                                   u32 %202 = OpConstant 3 
                                       %203 = OpTypePointer Output %6 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function f32* %96 = OpVariable Function 
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
                                  f32_2 %29 = OpLoad %9 
                                  f32_2 %32 = OpFAdd %29 %31 
                                                OpStore %28 %32 
                                  f32_2 %33 = OpLoad %28 
                                  f32_2 %34 = OpExtInst %1 4 %33 
                                  f32_2 %35 = OpLoad %28 
                                  f32_2 %36 = OpExtInst %1 4 %35 
                                    f32 %37 = OpDot %34 %36 
                           Private f32* %41 = OpAccessChain %28 %39 
                                                OpStore %41 %37 
                           Private f32* %42 = OpAccessChain %28 %39 
                                    f32 %43 = OpLoad %42 
                                    f32 %44 = OpExtInst %1 31 %43 
                           Private f32* %45 = OpAccessChain %28 %39 
                                                OpStore %45 %44 
                           Uniform f32* %48 = OpAccessChain %16 %46 
                                    f32 %49 = OpLoad %48 
                                    f32 %50 = OpFNegate %49 
                                    f32 %52 = OpFMul %50 %51 
                           Private f32* %53 = OpAccessChain %28 %39 
                                    f32 %54 = OpLoad %53 
                                    f32 %55 = OpFAdd %52 %54 
                           Private f32* %56 = OpAccessChain %28 %39 
                                                OpStore %56 %55 
                           Private f32* %57 = OpAccessChain %28 %39 
                                    f32 %58 = OpLoad %57 
                                    f32 %60 = OpFMul %58 %59 
                           Private f32* %61 = OpAccessChain %28 %39 
                                                OpStore %61 %60 
                           Private f32* %62 = OpAccessChain %28 %39 
                                    f32 %63 = OpLoad %62 
                                    f32 %64 = OpExtInst %1 13 %63 
                           Private f32* %65 = OpAccessChain %28 %39 
                                                OpStore %65 %64 
                           Private f32* %66 = OpAccessChain %28 %39 
                                    f32 %67 = OpLoad %66 
                           Private f32* %68 = OpAccessChain %28 %39 
                                    f32 %69 = OpLoad %68 
                                    f32 %70 = OpFMul %67 %69 
                           Private f32* %71 = OpAccessChain %28 %39 
                                                OpStore %71 %70 
                           Private f32* %73 = OpAccessChain %28 %39 
                                    f32 %74 = OpLoad %73 
                                    f32 %76 = OpFMul %74 %75 
                                                OpStore %72 %76 
                           Private f32* %81 = OpAccessChain %28 %39 
                                    f32 %82 = OpLoad %81 
                                   bool %83 = OpFOrdGreaterThanEqual %80 %82 
                                                OpStore %79 %83 
                                    f32 %87 = OpLoad %72 
                                    f32 %88 = OpExtInst %1 13 %87 
                           Private f32* %89 = OpAccessChain %86 %39 
                                                OpStore %89 %88 
                           Private f32* %90 = OpAccessChain %86 %39 
                                    f32 %91 = OpLoad %90 
                                    f32 %92 = OpLoad %72 
                                    f32 %93 = OpFDiv %91 %92 
                                                OpStore %72 %93 
                                   bool %94 = OpLoad %79 
                                                OpSelectionMerge %98 None 
                                                OpBranchConditional %94 %97 %100 
                                        %97 = OpLabel 
                                                OpStore %96 %99 
                                                OpBranch %98 
                                       %100 = OpLabel 
                                   f32 %101 = OpLoad %72 
                                   f32 %102 = OpExtInst %1 4 %101 
                                                OpStore %96 %102 
                                                OpBranch %98 
                                        %98 = OpLabel 
                                   f32 %103 = OpLoad %96 
                          Private f32* %104 = OpAccessChain %28 %39 
                                                OpStore %104 %103 
                   read_only Texture2D %108 = OpLoad %107 
                               sampler %112 = OpLoad %111 
            read_only Texture2DSampled %114 = OpSampledImage %108 %112 
                                 f32_2 %115 = OpLoad %9 
                                 f32_4 %116 = OpImageSampleImplicitLod %114 %115 
                                 f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                                OpStore %86 %117 
                                 f32_2 %118 = OpLoad %9 
                                 f32_2 %119 = OpFNegate %118 
                                 f32_2 %122 = OpFAdd %119 %121 
                                                OpStore %9 %122 
                                 f32_2 %123 = OpLoad %9 
                                 f32_2 %124 = OpLoad %9 
                                   f32 %125 = OpDot %123 %124 
                          Private f32* %126 = OpAccessChain %9 %39 
                                                OpStore %126 %125 
                          Private f32* %127 = OpAccessChain %9 %39 
                                   f32 %128 = OpLoad %127 
                                   f32 %129 = OpExtInst %1 31 %128 
                          Private f32* %130 = OpAccessChain %9 %39 
                                                OpStore %130 %129 
                          Private f32* %131 = OpAccessChain %9 %39 
                                   f32 %132 = OpLoad %131 
                          Uniform f32* %134 = OpAccessChain %16 %133 
                                   f32 %135 = OpLoad %134 
                                   f32 %136 = OpFNegate %135 
                                   f32 %137 = OpFAdd %132 %136 
                          Private f32* %138 = OpAccessChain %9 %39 
                                                OpStore %138 %137 
                                 f32_2 %140 = OpLoad %28 
                                 f32_3 %141 = OpVectorShuffle %140 %140 0 0 0 
                                 f32_3 %142 = OpLoad %86 
                                 f32_3 %143 = OpFNegate %142 
                                 f32_3 %144 = OpFAdd %141 %143 
                                                OpStore %139 %144 
                          Uniform f32* %146 = OpAccessChain %16 %133 
                                   f32 %147 = OpLoad %146 
                                   f32 %149 = OpFAdd %147 %148 
                                                OpStore %145 %149 
                                   f32 %150 = OpLoad %145 
                          Uniform f32* %152 = OpAccessChain %16 %151 
                                   f32 %153 = OpLoad %152 
                                   f32 %154 = OpFNegate %153 
                                   f32 %155 = OpFAdd %150 %154 
                                                OpStore %145 %155 
                                   f32 %156 = OpLoad %145 
                          Uniform f32* %157 = OpAccessChain %16 %133 
                                   f32 %158 = OpLoad %157 
                                   f32 %159 = OpFNegate %158 
                                   f32 %160 = OpFAdd %156 %159 
                                                OpStore %145 %160 
                                   f32 %161 = OpLoad %145 
                                   f32 %162 = OpFDiv %99 %161 
                                                OpStore %145 %162 
                          Private f32* %163 = OpAccessChain %9 %39 
                                   f32 %164 = OpLoad %163 
                                   f32 %165 = OpLoad %145 
                                   f32 %166 = OpFMul %164 %165 
                          Private f32* %167 = OpAccessChain %9 %39 
                                                OpStore %167 %166 
                          Private f32* %168 = OpAccessChain %9 %39 
                                   f32 %169 = OpLoad %168 
                                   f32 %171 = OpExtInst %1 43 %169 %170 %99 
                          Private f32* %172 = OpAccessChain %9 %39 
                                                OpStore %172 %171 
                          Private f32* %173 = OpAccessChain %9 %39 
                                   f32 %174 = OpLoad %173 
                                   f32 %176 = OpFMul %174 %175 
                                   f32 %178 = OpFAdd %176 %177 
                                                OpStore %145 %178 
                          Private f32* %179 = OpAccessChain %9 %39 
                                   f32 %180 = OpLoad %179 
                          Private f32* %181 = OpAccessChain %9 %39 
                                   f32 %182 = OpLoad %181 
                                   f32 %183 = OpFMul %180 %182 
                          Private f32* %184 = OpAccessChain %9 %39 
                                                OpStore %184 %183 
                                   f32 %185 = OpLoad %145 
                                   f32 %186 = OpFNegate %185 
                          Private f32* %187 = OpAccessChain %9 %39 
                                   f32 %188 = OpLoad %187 
                                   f32 %189 = OpFMul %186 %188 
                                   f32 %190 = OpFAdd %189 %99 
                          Private f32* %191 = OpAccessChain %9 %39 
                                                OpStore %191 %190 
                                 f32_2 %194 = OpLoad %9 
                                 f32_3 %195 = OpVectorShuffle %194 %194 0 0 0 
                                 f32_3 %196 = OpLoad %139 
                                 f32_3 %197 = OpFMul %195 %196 
                                 f32_3 %198 = OpLoad %86 
                                 f32_3 %199 = OpFAdd %197 %198 
                                 f32_4 %200 = OpLoad %193 
                                 f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                OpStore %193 %201 
                           Output f32* %204 = OpAccessChain %193 %202 
                                                OpStore %204 %99 
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