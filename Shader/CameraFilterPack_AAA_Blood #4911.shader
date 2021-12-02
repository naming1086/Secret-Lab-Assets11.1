//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/AAA_Blood" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38900
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Value3);
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Value4, _Value4, _Value4)) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Value5, _Value5, _Value5)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Value2, _Value2, _Value2)) + u_xlat2.xyz;
    u_xlat0.xy = u_xlat1.xx * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Value, _Value, _Value)) + u_xlat0.xyz;
    u_xlat9 = u_xlat1.x + 1.0;
    SV_Target0.x = u_xlat9 * u_xlat0.x;
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
; Bound: 159
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %145 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate %111 DescriptorSet 111 
                                                      OpDecorate %111 Binding 111 
                                                      OpDecorate %113 DescriptorSet 113 
                                                      OpDecorate %113 Binding 113 
                                                      OpDecorate %145 Location 145 
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
                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 5 
                                              %20 = OpTypePointer Uniform %14 
                               Private f32_3* %31 = OpVariable Private 
                                              %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %33 = OpTypePointer UniformConstant %32 
         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampler 
                                              %37 = OpTypePointer UniformConstant %36 
                     UniformConstant sampler* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampledImage %32 
                               Private f32_3* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 2 
                                              %48 = OpTypePointer Uniform %6 
                                          i32 %54 = OpConstant 3 
                                          i32 %70 = OpConstant 4 
                                          i32 %86 = OpConstant 1 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_2 %104 = OpConstantComposite %103 %103 
        UniformConstant read_only Texture2D* %111 = OpVariable UniformConstant 
                    UniformConstant sampler* %113 = OpVariable UniformConstant 
                                         i32 %121 = OpConstant 0 
                                             %136 = OpTypePointer Private %6 
                                Private f32* %137 = OpVariable Private 
                                             %138 = OpTypeInt 32 0 
                                         u32 %139 = OpConstant 0 
                                         f32 %142 = OpConstant 3.674022E-40 
                                             %144 = OpTypePointer Output %14 
                               Output f32_4* %145 = OpVariable Output 
                                             %150 = OpTypePointer Output %6 
                                         u32 %156 = OpConstant 3 
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
                          read_only Texture2D %35 = OpLoad %34 
                                      sampler %39 = OpLoad %38 
                   read_only Texture2DSampled %41 = OpSampledImage %35 %39 
                                        f32_2 %42 = OpLoad vs_TEXCOORD0 
                                        f32_4 %43 = OpImageSampleImplicitLod %41 %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                                      OpStore %31 %44 
                                        f32_3 %46 = OpLoad %31 
                                 Uniform f32* %49 = OpAccessChain %17 %47 
                                          f32 %50 = OpLoad %49 
                                        f32_3 %51 = OpCompositeConstruct %50 %50 %50 
                                        f32_3 %52 = OpFMul %46 %51 
                                                      OpStore %45 %52 
                                        f32_3 %53 = OpLoad %31 
                                 Uniform f32* %55 = OpAccessChain %17 %54 
                                          f32 %56 = OpLoad %55 
                                 Uniform f32* %57 = OpAccessChain %17 %54 
                                          f32 %58 = OpLoad %57 
                                 Uniform f32* %59 = OpAccessChain %17 %54 
                                          f32 %60 = OpLoad %59 
                                        f32_3 %61 = OpCompositeConstruct %56 %58 %60 
                                          f32 %62 = OpCompositeExtract %61 0 
                                          f32 %63 = OpCompositeExtract %61 1 
                                          f32 %64 = OpCompositeExtract %61 2 
                                        f32_3 %65 = OpCompositeConstruct %62 %63 %64 
                                        f32_3 %66 = OpFMul %53 %65 
                                        f32_3 %67 = OpLoad %45 
                                        f32_3 %68 = OpFAdd %66 %67 
                                                      OpStore %45 %68 
                                        f32_3 %69 = OpLoad %31 
                                 Uniform f32* %71 = OpAccessChain %17 %70 
                                          f32 %72 = OpLoad %71 
                                 Uniform f32* %73 = OpAccessChain %17 %70 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %75 = OpAccessChain %17 %70 
                                          f32 %76 = OpLoad %75 
                                        f32_3 %77 = OpCompositeConstruct %72 %74 %76 
                                          f32 %78 = OpCompositeExtract %77 0 
                                          f32 %79 = OpCompositeExtract %77 1 
                                          f32 %80 = OpCompositeExtract %77 2 
                                        f32_3 %81 = OpCompositeConstruct %78 %79 %80 
                                        f32_3 %82 = OpFMul %69 %81 
                                        f32_3 %83 = OpLoad %45 
                                        f32_3 %84 = OpFAdd %82 %83 
                                                      OpStore %45 %84 
                                        f32_3 %85 = OpLoad %31 
                                 Uniform f32* %87 = OpAccessChain %17 %86 
                                          f32 %88 = OpLoad %87 
                                 Uniform f32* %89 = OpAccessChain %17 %86 
                                          f32 %90 = OpLoad %89 
                                 Uniform f32* %91 = OpAccessChain %17 %86 
                                          f32 %92 = OpLoad %91 
                                        f32_3 %93 = OpCompositeConstruct %88 %90 %92 
                                          f32 %94 = OpCompositeExtract %93 0 
                                          f32 %95 = OpCompositeExtract %93 1 
                                          f32 %96 = OpCompositeExtract %93 2 
                                        f32_3 %97 = OpCompositeConstruct %94 %95 %96 
                                        f32_3 %98 = OpFMul %85 %97 
                                        f32_3 %99 = OpLoad %45 
                                       f32_3 %100 = OpFAdd %98 %99 
                                                      OpStore %31 %100 
                                       f32_3 %101 = OpLoad %31 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_3 %106 = OpLoad %9 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_3 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %108 3 4 2 
                                                      OpStore %9 %110 
                         read_only Texture2D %112 = OpLoad %111 
                                     sampler %114 = OpLoad %113 
                  read_only Texture2DSampled %115 = OpSampledImage %112 %114 
                                       f32_3 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_4 %118 = OpImageSampleImplicitLod %115 %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                                      OpStore %9 %119 
                                       f32_3 %120 = OpLoad %31 
                                Uniform f32* %122 = OpAccessChain %17 %121 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %124 = OpAccessChain %17 %121 
                                         f32 %125 = OpLoad %124 
                                Uniform f32* %126 = OpAccessChain %17 %121 
                                         f32 %127 = OpLoad %126 
                                       f32_3 %128 = OpCompositeConstruct %123 %125 %127 
                                         f32 %129 = OpCompositeExtract %128 0 
                                         f32 %130 = OpCompositeExtract %128 1 
                                         f32 %131 = OpCompositeExtract %128 2 
                                       f32_3 %132 = OpCompositeConstruct %129 %130 %131 
                                       f32_3 %133 = OpFMul %120 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_3 %135 = OpFAdd %133 %134 
                                                      OpStore %9 %135 
                                Private f32* %140 = OpAccessChain %31 %139 
                                         f32 %141 = OpLoad %140 
                                         f32 %143 = OpFAdd %141 %142 
                                                      OpStore %137 %143 
                                         f32 %146 = OpLoad %137 
                                Private f32* %147 = OpAccessChain %9 %139 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                 Output f32* %151 = OpAccessChain %145 %139 
                                                      OpStore %151 %149 
                                       f32_3 %152 = OpLoad %9 
                                       f32_2 %153 = OpVectorShuffle %152 %152 1 2 
                                       f32_4 %154 = OpLoad %145 
                                       f32_4 %155 = OpVectorShuffle %154 %153 0 4 5 3 
                                                      OpStore %145 %155 
                                 Output f32* %157 = OpAccessChain %145 %156 
                                                      OpStore %157 %142 
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