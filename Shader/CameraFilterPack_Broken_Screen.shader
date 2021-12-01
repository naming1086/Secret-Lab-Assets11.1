//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Broken_Screen" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 39186
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
uniform 	float _Fade;
uniform 	float _Shadow;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
UNITY_LOCATION(1) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex2, u_xlat0.xy);
    u_xlat4.xy = u_xlat1.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat1.x = u_xlat1.z * _Fade;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat4.xy + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0 = (-u_xlat1.xxxx) * vec4(vec4(_Shadow, _Shadow, _Shadow, _Shadow)) + u_xlat0;
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
; Bound: 122
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %99 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %35 DescriptorSet 35 
                                             OpDecorate %35 Binding 35 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %90 DescriptorSet 90 
                                             OpDecorate %90 Binding 90 
                                             OpDecorate %92 DescriptorSet 92 
                                             OpDecorate %92 Binding 92 
                                             OpDecorate %99 Location 99 
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
                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %34 = OpTypePointer UniformConstant %33 
UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
                                     %37 = OpTypeSampler 
                                     %38 = OpTypePointer UniformConstant %37 
            UniformConstant sampler* %39 = OpVariable UniformConstant 
                                     %41 = OpTypeSampledImage %33 
                                     %47 = OpTypePointer Private %10 
                      Private f32_2* %48 = OpVariable Private 
                                 f32 %51 = OpConstant 3.674022E-40 
                                 f32 %52 = OpConstant 3.674022E-40 
                               f32_2 %53 = OpConstantComposite %51 %52 
                                 f32 %55 = OpConstant 3.674022E-40 
                               f32_2 %56 = OpConstantComposite %55 %51 
                                     %58 = OpTypeInt 32 0 
                                 u32 %59 = OpConstant 2 
                                     %60 = OpTypePointer Private %6 
                                 i32 %63 = OpConstant 0 
                                     %64 = OpTypePointer Uniform %6 
                                 u32 %68 = OpConstant 0 
UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
            UniformConstant sampler* %92 = OpVariable UniformConstant 
                                     %98 = OpTypePointer Output %7 
                       Output f32_4* %99 = OpVariable Output 
                                i32 %103 = OpConstant 1 
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
                 read_only Texture2D %36 = OpLoad %35 
                             sampler %40 = OpLoad %39 
          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
                               f32_4 %43 = OpLoad %9 
                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                               f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                             OpStore %32 %46 
                               f32_3 %49 = OpLoad %32 
                               f32_2 %50 = OpVectorShuffle %49 %49 0 1 
                               f32_2 %54 = OpFMul %50 %53 
                               f32_2 %57 = OpFAdd %54 %56 
                                             OpStore %48 %57 
                        Private f32* %61 = OpAccessChain %32 %59 
                                 f32 %62 = OpLoad %61 
                        Uniform f32* %65 = OpAccessChain %16 %63 
                                 f32 %66 = OpLoad %65 
                                 f32 %67 = OpFMul %62 %66 
                        Private f32* %69 = OpAccessChain %32 %68 
                                             OpStore %69 %67 
                               f32_4 %70 = OpLoad %9 
                               f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                               f32_2 %72 = OpFNegate %71 
                               f32_2 %73 = OpLoad %48 
                               f32_2 %74 = OpFAdd %72 %73 
                                             OpStore %48 %74 
                        Uniform f32* %75 = OpAccessChain %16 %63 
                                 f32 %76 = OpLoad %75 
                        Uniform f32* %77 = OpAccessChain %16 %63 
                                 f32 %78 = OpLoad %77 
                               f32_2 %79 = OpCompositeConstruct %76 %78 
                                 f32 %80 = OpCompositeExtract %79 0 
                                 f32 %81 = OpCompositeExtract %79 1 
                               f32_2 %82 = OpCompositeConstruct %80 %81 
                               f32_2 %83 = OpLoad %48 
                               f32_2 %84 = OpFMul %82 %83 
                               f32_4 %85 = OpLoad %9 
                               f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                               f32_2 %87 = OpFAdd %84 %86 
                               f32_4 %88 = OpLoad %9 
                               f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                             OpStore %9 %89 
                 read_only Texture2D %91 = OpLoad %90 
                             sampler %93 = OpLoad %92 
          read_only Texture2DSampled %94 = OpSampledImage %91 %93 
                               f32_4 %95 = OpLoad %9 
                               f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               f32_4 %97 = OpImageSampleImplicitLod %94 %96 
                                             OpStore %9 %97 
                              f32_3 %100 = OpLoad %32 
                              f32_4 %101 = OpVectorShuffle %100 %100 0 0 0 0 
                              f32_4 %102 = OpFNegate %101 
                       Uniform f32* %104 = OpAccessChain %16 %103 
                                f32 %105 = OpLoad %104 
                       Uniform f32* %106 = OpAccessChain %16 %103 
                                f32 %107 = OpLoad %106 
                       Uniform f32* %108 = OpAccessChain %16 %103 
                                f32 %109 = OpLoad %108 
                       Uniform f32* %110 = OpAccessChain %16 %103 
                                f32 %111 = OpLoad %110 
                              f32_4 %112 = OpCompositeConstruct %105 %107 %109 %111 
                                f32 %113 = OpCompositeExtract %112 0 
                                f32 %114 = OpCompositeExtract %112 1 
                                f32 %115 = OpCompositeExtract %112 2 
                                f32 %116 = OpCompositeExtract %112 3 
                              f32_4 %117 = OpCompositeConstruct %113 %114 %115 %116 
                              f32_4 %118 = OpFMul %102 %117 
                              f32_4 %119 = OpLoad %9 
                              f32_4 %120 = OpFAdd %118 %119 
                                             OpStore %99 %120 
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