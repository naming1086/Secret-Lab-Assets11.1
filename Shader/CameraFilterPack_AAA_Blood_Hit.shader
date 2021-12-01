//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_Blood_Hit" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 40248
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
 vec4 phase0_Output0_0;
out vec2 vs_TEXCOORD1;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	float _Value7;
uniform 	float _Value8;
uniform 	float _Value9;
uniform 	float _Value10;
uniform 	float _Value11;
uniform 	float _Value12;
uniform 	float _Value13;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat11;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
    u_xlat0 = texture(_MainTex2, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat1.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat3 = texture(_MainTex2, u_xlat2.xy);
    u_xlat2 = texture(_MainTex2, u_xlat2.zw);
    u_xlat15 = u_xlat3.x * _Value3;
    u_xlat0.x = u_xlat0.x * _Value2 + u_xlat15;
    u_xlat11.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat4 = texture(_MainTex2, u_xlat11.xy);
    u_xlat0.x = u_xlat4.x * _Value4 + u_xlat0.x;
    u_xlat0.x = u_xlat2.x * _Value5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.y * _Value6 + u_xlat0.x;
    u_xlat0.x = u_xlat3.y * _Value7 + u_xlat0.x;
    u_xlat0.x = u_xlat4.y * _Value8 + u_xlat0.x;
    u_xlat0.x = u_xlat2.y * _Value9 + u_xlat0.x;
    u_xlat0.x = u_xlat0.z * _Value10 + u_xlat0.x;
    u_xlat0.x = u_xlat3.z * _Value11 + u_xlat0.x;
    u_xlat0.x = u_xlat4.z * _Value12 + u_xlat0.x;
    u_xlat0.x = u_xlat2.z * _Value13 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Value;
    u_xlat1.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + u_xlat1.xy;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat0.yz = u_xlat1.yz;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat0.xyz;
    SV_Target0.x = u_xlat1.x + u_xlat0.x;
    SV_Target0.yz = u_xlat0.yz;
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
; Bound: 135
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %30 %58 %109 %119 %120 %123 %126 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %13 ArrayStride 13 
                                                     OpDecorate %14 ArrayStride 14 
                                                     OpMemberDecorate %16 0 Offset 16 
                                                     OpMemberDecorate %16 1 Offset 16 
                                                     OpMemberDecorate %16 2 Offset 16 
                                                     OpDecorate %16 Block 
                                                     OpDecorate %18 DescriptorSet 18 
                                                     OpDecorate %18 Binding 18 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %58 Location 58 
                                                     OpMemberDecorate %107 0 BuiltIn 107 
                                                     OpMemberDecorate %107 1 BuiltIn 107 
                                                     OpMemberDecorate %107 2 BuiltIn 107 
                                                     OpDecorate %107 Block 
                                                     OpDecorate %119 Location 119 
                                                     OpDecorate %120 Location 120 
                                                     OpDecorate vs_TEXCOORD0 Location 123 
                                                     OpDecorate vs_TEXCOORD1 Location 126 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeBool 
                                              %7 = OpTypePointer Private %6 
                                Private bool* %8 = OpVariable Private 
                                              %9 = OpTypeFloat 32 
                                             %10 = OpTypeVector %9 4 
                                             %11 = OpTypeInt 32 0 
                                         u32 %12 = OpConstant 4 
                                             %13 = OpTypeArray %10 %12 
                                             %14 = OpTypeArray %10 %12 
                                             %15 = OpTypeVector %9 2 
                                             %16 = OpTypeStruct %13 %14 %15 
                                             %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
                                             %19 = OpTypeInt 32 1 
                                         i32 %20 = OpConstant 2 
                                         u32 %21 = OpConstant 1 
                                             %22 = OpTypePointer Uniform %9 
                                         f32 %25 = OpConstant 3.674022E-40 
                                             %27 = OpTypePointer Private %9 
                                Private f32* %28 = OpVariable Private 
                                             %29 = OpTypePointer Input %15 
                                Input f32_2* %30 = OpVariable Input 
                                             %31 = OpTypePointer Input %9 
                                         f32 %35 = OpConstant 3.674022E-40 
                                             %37 = OpTypePointer Private %10 
                              Private f32_4* %38 = OpVariable Private 
                                             %40 = OpTypePointer Function %9 
                                         u32 %49 = OpConstant 3 
                                             %51 = OpTypeVector %9 3 
                              Private f32_4* %56 = OpVariable Private 
                                             %57 = OpTypePointer Input %10 
                                Input f32_4* %58 = OpVariable Input 
                                         i32 %61 = OpConstant 0 
                                         i32 %62 = OpConstant 1 
                                             %63 = OpTypePointer Uniform %10 
                                         i32 %82 = OpConstant 3 
                              Private f32_4* %86 = OpVariable Private 
                                            %106 = OpTypeArray %9 %21 
                                            %107 = OpTypeStruct %10 %9 %106 
                                            %108 = OpTypePointer Output %107 
       Output struct {f32_4; f32; f32[1];}* %109 = OpVariable Output 
                                            %117 = OpTypePointer Output %10 
                              Output f32_4* %119 = OpVariable Output 
                               Input f32_4* %120 = OpVariable Input 
                                            %122 = OpTypePointer Output %15 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                            %129 = OpTypePointer Output %9 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %41 = OpVariable Function 
                                Uniform f32* %23 = OpAccessChain %18 %20 %21 
                                         f32 %24 = OpLoad %23 
                                        bool %26 = OpFOrdLessThan %24 %25 
                                                     OpStore %8 %26 
                                  Input f32* %32 = OpAccessChain %30 %21 
                                         f32 %33 = OpLoad %32 
                                         f32 %34 = OpFNegate %33 
                                         f32 %36 = OpFAdd %34 %35 
                                                     OpStore %28 %36 
                                        bool %39 = OpLoad %8 
                                                     OpSelectionMerge %43 None 
                                                     OpBranchConditional %39 %42 %45 
                                             %42 = OpLabel 
                                         f32 %44 = OpLoad %28 
                                                     OpStore %41 %44 
                                                     OpBranch %43 
                                             %45 = OpLabel 
                                  Input f32* %46 = OpAccessChain %30 %21 
                                         f32 %47 = OpLoad %46 
                                                     OpStore %41 %47 
                                                     OpBranch %43 
                                             %43 = OpLabel 
                                         f32 %48 = OpLoad %41 
                                Private f32* %50 = OpAccessChain %38 %49 
                                                     OpStore %50 %48 
                                       f32_2 %52 = OpLoad %30 
                                       f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
                                       f32_4 %54 = OpLoad %38 
                                       f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                                     OpStore %38 %55 
                                       f32_4 %59 = OpLoad %58 
                                       f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %18 %61 %62 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %60 %65 
                                                     OpStore %56 %66 
                              Uniform f32_4* %67 = OpAccessChain %18 %61 %61 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %58 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %56 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %56 %73 
                              Uniform f32_4* %74 = OpAccessChain %18 %61 %20 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %58 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %56 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %56 %80 
                                       f32_4 %81 = OpLoad %56 
                              Uniform f32_4* %83 = OpAccessChain %18 %61 %82 
                                       f32_4 %84 = OpLoad %83 
                                       f32_4 %85 = OpFAdd %81 %84 
                                                     OpStore %56 %85 
                                       f32_4 %87 = OpLoad %56 
                                       f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
                              Uniform f32_4* %89 = OpAccessChain %18 %62 %62 
                                       f32_4 %90 = OpLoad %89 
                                       f32_4 %91 = OpFMul %88 %90 
                                                     OpStore %86 %91 
                              Uniform f32_4* %92 = OpAccessChain %18 %62 %61 
                                       f32_4 %93 = OpLoad %92 
                                       f32_4 %94 = OpLoad %56 
                                       f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
                                       f32_4 %96 = OpFMul %93 %95 
                                       f32_4 %97 = OpLoad %86 
                                       f32_4 %98 = OpFAdd %96 %97 
                                                     OpStore %86 %98 
                              Uniform f32_4* %99 = OpAccessChain %18 %62 %20 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %56 
                                      f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %86 
                                      f32_4 %105 = OpFAdd %103 %104 
                                                     OpStore %86 %105 
                             Uniform f32_4* %110 = OpAccessChain %18 %62 %82 
                                      f32_4 %111 = OpLoad %110 
                                      f32_4 %112 = OpLoad %56 
                                      f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                      f32_4 %114 = OpFMul %111 %113 
                                      f32_4 %115 = OpLoad %86 
                                      f32_4 %116 = OpFAdd %114 %115 
                              Output f32_4* %118 = OpAccessChain %109 %61 
                                                     OpStore %118 %116 
                                      f32_4 %121 = OpLoad %120 
                                                     OpStore %119 %121 
                                      f32_4 %124 = OpLoad %38 
                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                                     OpStore vs_TEXCOORD0 %125 
                                      f32_4 %127 = OpLoad %38 
                                      f32_2 %128 = OpVectorShuffle %127 %127 2 3 
                                                     OpStore vs_TEXCOORD1 %128 
                                Output f32* %130 = OpAccessChain %109 %61 %21 
                                        f32 %131 = OpLoad %130 
                                        f32 %132 = OpFNegate %131 
                                Output f32* %133 = OpAccessChain %109 %61 %21 
                                                     OpStore %133 %132 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 268
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %252 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpMemberDecorate %39 12 Offset 39 
                                                      OpMemberDecorate %39 13 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %233 DescriptorSet 233 
                                                      OpDecorate %233 Binding 233 
                                                      OpDecorate %252 Location 252 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                        f32_2 %15 = OpConstantComposite %14 %14 
                                          f32 %17 = OpConstant 3.674022E-40 
                                        f32_2 %18 = OpConstantComposite %17 %14 
                                              %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %23 = OpTypePointer UniformConstant %22 
         UniformConstant read_only Texture2D* %24 = OpVariable UniformConstant 
                                              %26 = OpTypeSampler 
                                              %27 = OpTypePointer UniformConstant %26 
                     UniformConstant sampler* %28 = OpVariable UniformConstant 
                                              %30 = OpTypeSampledImage %22 
                                              %34 = OpTypeVector %6 4 
                               Private f32_3* %37 = OpVariable Private 
                                              %39 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %34 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 13 
                                              %44 = OpTypePointer Uniform %34 
                                              %55 = OpTypePointer Private %34 
                               Private f32_4* %56 = OpVariable Private 
                                        f32_4 %59 = OpConstantComposite %14 %14 %14 %14 
                                        f32_4 %61 = OpConstantComposite %14 %14 %14 %17 
                               Private f32_3* %63 = OpVariable Private 
                                              %80 = OpTypePointer Private %6 
                                 Private f32* %81 = OpVariable Private 
                                              %82 = OpTypeInt 32 0 
                                          u32 %83 = OpConstant 0 
                                          i32 %86 = OpConstant 2 
                                              %87 = OpTypePointer Uniform %6 
                                          i32 %93 = OpConstant 1 
                                             %100 = OpTypePointer Private %10 
                              Private f32_2* %101 = OpVariable Private 
                              Private f32_3* %105 = OpVariable Private 
                                         i32 %114 = OpConstant 3 
                                         i32 %124 = OpConstant 4 
                                         u32 %132 = OpConstant 1 
                                         i32 %135 = OpConstant 5 
                                         i32 %145 = OpConstant 6 
                                         i32 %155 = OpConstant 7 
                                         i32 %165 = OpConstant 8 
                                         u32 %173 = OpConstant 2 
                                         i32 %176 = OpConstant 9 
                                         i32 %186 = OpConstant 10 
                                         i32 %196 = OpConstant 11 
                                         i32 %206 = OpConstant 12 
                                         i32 %216 = OpConstant 0 
                                         f32 %223 = OpConstant 3.674022E-40 
                                       f32_2 %224 = OpConstantComposite %223 %223 
        UniformConstant read_only Texture2D* %231 = OpVariable UniformConstant 
                    UniformConstant sampler* %233 = OpVariable UniformConstant 
                                         f32 %246 = OpConstant 3.674022E-40 
                                       f32_3 %247 = OpConstantComposite %246 %246 %246 
                                             %251 = OpTypePointer Output %34 
                               Output f32_4* %252 = OpVariable Output 
                                             %258 = OpTypePointer Output %6 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         u32 %265 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_2 %16 = OpFMul %13 %15 
                                        f32_2 %19 = OpFAdd %16 %18 
                                        f32_3 %20 = OpLoad %9 
                                        f32_3 %21 = OpVectorShuffle %20 %19 3 4 2 
                                                      OpStore %9 %21 
                          read_only Texture2D %25 = OpLoad %24 
                                      sampler %29 = OpLoad %28 
                   read_only Texture2DSampled %31 = OpSampledImage %25 %29 
                                        f32_3 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_4 %35 = OpImageSampleImplicitLod %31 %33 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                                      OpStore %9 %36 
                                        f32_2 %38 = OpLoad vs_TEXCOORD0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                        f32_2 %48 = OpFMul %38 %47 
                               Uniform f32_4* %49 = OpAccessChain %41 %43 
                                        f32_4 %50 = OpLoad %49 
                                        f32_2 %51 = OpVectorShuffle %50 %50 2 3 
                                        f32_2 %52 = OpFAdd %48 %51 
                                        f32_3 %53 = OpLoad %37 
                                        f32_3 %54 = OpVectorShuffle %53 %52 3 4 2 
                                                      OpStore %37 %54 
                                        f32_3 %57 = OpLoad %37 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
                                        f32_4 %60 = OpFMul %58 %59 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %56 %62 
                          read_only Texture2D %64 = OpLoad %24 
                                      sampler %65 = OpLoad %28 
                   read_only Texture2DSampled %66 = OpSampledImage %64 %65 
                                        f32_4 %67 = OpLoad %56 
                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                        f32_4 %69 = OpImageSampleImplicitLod %66 %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %63 %70 
                          read_only Texture2D %71 = OpLoad %24 
                                      sampler %72 = OpLoad %28 
                   read_only Texture2DSampled %73 = OpSampledImage %71 %72 
                                        f32_4 %74 = OpLoad %56 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_4 %76 = OpImageSampleImplicitLod %73 %75 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_4 %78 = OpLoad %56 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %56 %79 
                                 Private f32* %84 = OpAccessChain %63 %83 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %88 = OpAccessChain %41 %86 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFMul %85 %89 
                                                      OpStore %81 %90 
                                 Private f32* %91 = OpAccessChain %9 %83 
                                          f32 %92 = OpLoad %91 
                                 Uniform f32* %94 = OpAccessChain %41 %93 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFMul %92 %95 
                                          f32 %97 = OpLoad %81 
                                          f32 %98 = OpFAdd %96 %97 
                                 Private f32* %99 = OpAccessChain %9 %83 
                                                      OpStore %99 %98 
                                       f32_3 %102 = OpLoad %37 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %103 %15 
                                                      OpStore %101 %104 
                         read_only Texture2D %106 = OpLoad %24 
                                     sampler %107 = OpLoad %28 
                  read_only Texture2DSampled %108 = OpSampledImage %106 %107 
                                       f32_2 %109 = OpLoad %101 
                                       f32_4 %110 = OpImageSampleImplicitLod %108 %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %105 %111 
                                Private f32* %112 = OpAccessChain %105 %83 
                                         f32 %113 = OpLoad %112 
                                Uniform f32* %115 = OpAccessChain %41 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %113 %116 
                                Private f32* %118 = OpAccessChain %9 %83 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %117 %119 
                                Private f32* %121 = OpAccessChain %9 %83 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %56 %83 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %125 = OpAccessChain %41 %124 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %123 %126 
                                Private f32* %128 = OpAccessChain %9 %83 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFAdd %127 %129 
                                Private f32* %131 = OpAccessChain %9 %83 
                                                      OpStore %131 %130 
                                Private f32* %133 = OpAccessChain %9 %132 
                                         f32 %134 = OpLoad %133 
                                Uniform f32* %136 = OpAccessChain %41 %135 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                Private f32* %139 = OpAccessChain %9 %83 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %9 %83 
                                                      OpStore %142 %141 
                                Private f32* %143 = OpAccessChain %63 %132 
                                         f32 %144 = OpLoad %143 
                                Uniform f32* %146 = OpAccessChain %41 %145 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFMul %144 %147 
                                Private f32* %149 = OpAccessChain %9 %83 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFAdd %148 %150 
                                Private f32* %152 = OpAccessChain %9 %83 
                                                      OpStore %152 %151 
                                Private f32* %153 = OpAccessChain %105 %132 
                                         f32 %154 = OpLoad %153 
                                Uniform f32* %156 = OpAccessChain %41 %155 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %154 %157 
                                Private f32* %159 = OpAccessChain %9 %83 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpFAdd %158 %160 
                                Private f32* %162 = OpAccessChain %9 %83 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %56 %132 
                                         f32 %164 = OpLoad %163 
                                Uniform f32* %166 = OpAccessChain %41 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFMul %164 %167 
                                Private f32* %169 = OpAccessChain %9 %83 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFAdd %168 %170 
                                Private f32* %172 = OpAccessChain %9 %83 
                                                      OpStore %172 %171 
                                Private f32* %174 = OpAccessChain %9 %173 
                                         f32 %175 = OpLoad %174 
                                Uniform f32* %177 = OpAccessChain %41 %176 
                                         f32 %178 = OpLoad %177 
                                         f32 %179 = OpFMul %175 %178 
                                Private f32* %180 = OpAccessChain %9 %83 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFAdd %179 %181 
                                Private f32* %183 = OpAccessChain %9 %83 
                                                      OpStore %183 %182 
                                Private f32* %184 = OpAccessChain %63 %173 
                                         f32 %185 = OpLoad %184 
                                Uniform f32* %187 = OpAccessChain %41 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %9 %83 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFAdd %189 %191 
                                Private f32* %193 = OpAccessChain %9 %83 
                                                      OpStore %193 %192 
                                Private f32* %194 = OpAccessChain %105 %173 
                                         f32 %195 = OpLoad %194 
                                Uniform f32* %197 = OpAccessChain %41 %196 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %195 %198 
                                Private f32* %200 = OpAccessChain %9 %83 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFAdd %199 %201 
                                Private f32* %203 = OpAccessChain %9 %83 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %56 %173 
                                         f32 %205 = OpLoad %204 
                                Uniform f32* %207 = OpAccessChain %41 %206 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFMul %205 %208 
                                Private f32* %210 = OpAccessChain %9 %83 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFAdd %209 %211 
                                Private f32* %213 = OpAccessChain %9 %83 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %9 %83 
                                         f32 %215 = OpLoad %214 
                                Uniform f32* %217 = OpAccessChain %41 %216 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %215 %218 
                                Private f32* %220 = OpAccessChain %9 %83 
                                                      OpStore %220 %219 
                                       f32_3 %221 = OpLoad %9 
                                       f32_2 %222 = OpVectorShuffle %221 %221 0 0 
                                       f32_2 %225 = OpFMul %222 %224 
                                       f32_3 %226 = OpLoad %37 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                       f32_2 %228 = OpFAdd %225 %227 
                                       f32_3 %229 = OpLoad %37 
                                       f32_3 %230 = OpVectorShuffle %229 %228 3 4 2 
                                                      OpStore %37 %230 
                         read_only Texture2D %232 = OpLoad %231 
                                     sampler %234 = OpLoad %233 
                  read_only Texture2DSampled %235 = OpSampledImage %232 %234 
                                       f32_3 %236 = OpLoad %37 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                       f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                                      OpStore %37 %239 
                                       f32_3 %240 = OpLoad %37 
                                       f32_2 %241 = OpVectorShuffle %240 %240 1 2 
                                       f32_3 %242 = OpLoad %9 
                                       f32_3 %243 = OpVectorShuffle %242 %241 0 3 4 
                                                      OpStore %9 %243 
                                       f32_3 %244 = OpLoad %9 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %248 = OpFMul %245 %247 
                                       f32_3 %249 = OpLoad %9 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %9 %250 
                                Private f32* %253 = OpAccessChain %37 %83 
                                         f32 %254 = OpLoad %253 
                                Private f32* %255 = OpAccessChain %9 %83 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                 Output f32* %259 = OpAccessChain %252 %83 
                                                      OpStore %259 %257 
                                       f32_3 %260 = OpLoad %9 
                                       f32_2 %261 = OpVectorShuffle %260 %260 1 2 
                                       f32_4 %262 = OpLoad %252 
                                       f32_4 %263 = OpVectorShuffle %262 %261 0 4 5 3 
                                                      OpStore %252 %263 
                                 Output f32* %266 = OpAccessChain %252 %265 
                                                      OpStore %266 %264 
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