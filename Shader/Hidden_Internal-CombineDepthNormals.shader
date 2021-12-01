//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-CombineDepthNormals" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58289
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
uniform 	vec4 _CameraNormalsTexture_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraNormalsTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat0 = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlatb3 = u_xlat1.x<0.999984622;
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    SV_Target0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_2 %87 = OpLoad %86 
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 170
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %162 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpDecorate %45 ArrayStride 45 
                                              OpMemberDecorate %46 0 Offset 46 
                                              OpMemberDecorate %46 1 Offset 46 
                                              OpDecorate %46 Block 
                                              OpDecorate %48 DescriptorSet 48 
                                              OpDecorate %48 Binding 48 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %106 DescriptorSet 106 
                                              OpDecorate %106 Binding 106 
                                              OpDecorate %162 Location 162 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %11 = OpTypePointer UniformConstant %10 
 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                      %14 = OpTypeSampler 
                                      %15 = OpTypePointer UniformConstant %14 
             UniformConstant sampler* %16 = OpVariable UniformConstant 
                                      %18 = OpTypeSampledImage %10 
                                      %20 = OpTypeVector %6 2 
                                      %21 = OpTypePointer Input %20 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %25 = OpTypeVector %6 3 
                                  f32 %31 = OpConstant 3.674022E-40 
                                f32_3 %32 = OpConstantComposite %31 %31 %31 
                                  f32 %34 = OpConstant 3.674022E-40 
                                f32_3 %35 = OpConstantComposite %34 %34 %34 
                                      %39 = OpTypePointer Private %25 
                       Private f32_3* %40 = OpVariable Private 
                                      %43 = OpTypeInt 32 0 
                                  u32 %44 = OpConstant 4 
                                      %45 = OpTypeArray %7 %44 
                                      %46 = OpTypeStruct %7 %45 
                                      %47 = OpTypePointer Uniform %46 
   Uniform struct {f32_4; f32_4[4];}* %48 = OpVariable Uniform 
                                      %49 = OpTypeInt 32 1 
                                  i32 %50 = OpConstant 1 
                                      %51 = OpTypePointer Uniform %7 
                                  i32 %56 = OpConstant 0 
                                  i32 %67 = OpConstant 2 
                                      %79 = OpTypePointer Private %6 
                         Private f32* %80 = OpVariable Private 
                                  u32 %81 = OpConstant 2 
                                  f32 %85 = OpConstant 3.674022E-40 
                                  f32 %96 = OpConstant 3.674022E-40 
                                f32_2 %97 = OpConstantComposite %96 %96 
                                  f32 %99 = OpConstant 3.674022E-40 
                               f32_2 %100 = OpConstantComposite %99 %99 
UniformConstant read_only Texture2D* %104 = OpVariable UniformConstant 
            UniformConstant sampler* %106 = OpVariable UniformConstant 
                                 u32 %111 = OpConstant 0 
                                     %114 = OpTypePointer Uniform %6 
                                 u32 %120 = OpConstant 1 
                                     %129 = OpTypeBool 
                                     %130 = OpTypePointer Private %129 
                       Private bool* %131 = OpVariable Private 
                                 f32 %134 = OpConstant 3.674022E-40 
                                 f32 %138 = OpConstant 3.674022E-40 
                               f32_2 %139 = OpConstantComposite %85 %138 
                                 f32 %151 = OpConstant 3.674022E-40 
                                 u32 %159 = OpConstant 3 
                                     %161 = OpTypePointer Output %7 
                       Output f32_4* %162 = OpVariable Output 
                               f32_4 %165 = OpConstantComposite %99 %99 %85 %85 
                                     %166 = OpTypeVector %129 4 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                f32_3 %26 = OpVectorShuffle %24 %24 0 1 2 
                                f32_4 %27 = OpLoad %9 
                                f32_4 %28 = OpVectorShuffle %27 %26 4 5 6 3 
                                              OpStore %9 %28 
                                f32_4 %29 = OpLoad %9 
                                f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                f32_3 %33 = OpFMul %30 %32 
                                f32_3 %36 = OpFAdd %33 %35 
                                f32_4 %37 = OpLoad %9 
                                f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                              OpStore %9 %38 
                                f32_4 %41 = OpLoad %9 
                                f32_3 %42 = OpVectorShuffle %41 %41 1 1 1 
                       Uniform f32_4* %52 = OpAccessChain %48 %50 %50 
                                f32_4 %53 = OpLoad %52 
                                f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                                f32_3 %55 = OpFMul %42 %54 
                                              OpStore %40 %55 
                       Uniform f32_4* %57 = OpAccessChain %48 %50 %56 
                                f32_4 %58 = OpLoad %57 
                                f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                f32_4 %60 = OpLoad %9 
                                f32_3 %61 = OpVectorShuffle %60 %60 0 0 0 
                                f32_3 %62 = OpFMul %59 %61 
                                f32_3 %63 = OpLoad %40 
                                f32_3 %64 = OpFAdd %62 %63 
                                f32_4 %65 = OpLoad %9 
                                f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 6 
                                              OpStore %9 %66 
                       Uniform f32_4* %68 = OpAccessChain %48 %50 %67 
                                f32_4 %69 = OpLoad %68 
                                f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                f32_4 %71 = OpLoad %9 
                                f32_3 %72 = OpVectorShuffle %71 %71 2 2 2 
                                f32_3 %73 = OpFMul %70 %72 
                                f32_4 %74 = OpLoad %9 
                                f32_3 %75 = OpVectorShuffle %74 %74 0 1 3 
                                f32_3 %76 = OpFAdd %73 %75 
                                f32_4 %77 = OpLoad %9 
                                f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                              OpStore %9 %78 
                         Private f32* %82 = OpAccessChain %9 %81 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpFNegate %83 
                                  f32 %86 = OpFAdd %84 %85 
                                              OpStore %80 %86 
                                f32_4 %87 = OpLoad %9 
                                f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                  f32 %89 = OpLoad %80 
                                f32_2 %90 = OpCompositeConstruct %89 %89 
                                f32_2 %91 = OpFDiv %88 %90 
                                f32_4 %92 = OpLoad %9 
                                f32_4 %93 = OpVectorShuffle %92 %91 4 5 2 3 
                                              OpStore %9 %93 
                                f32_4 %94 = OpLoad %9 
                                f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                f32_2 %98 = OpFMul %95 %97 
                               f32_2 %101 = OpFAdd %98 %100 
                               f32_4 %102 = OpLoad %9 
                               f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
                                              OpStore %9 %103 
                 read_only Texture2D %105 = OpLoad %104 
                             sampler %107 = OpLoad %106 
          read_only Texture2DSampled %108 = OpSampledImage %105 %107 
                               f32_2 %109 = OpLoad vs_TEXCOORD0 
                               f32_4 %110 = OpImageSampleImplicitLod %108 %109 
                                 f32 %112 = OpCompositeExtract %110 0 
                        Private f32* %113 = OpAccessChain %40 %111 
                                              OpStore %113 %112 
                        Uniform f32* %115 = OpAccessChain %48 %56 %111 
                                 f32 %116 = OpLoad %115 
                        Private f32* %117 = OpAccessChain %40 %111 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpFMul %116 %118 
                        Uniform f32* %121 = OpAccessChain %48 %56 %120 
                                 f32 %122 = OpLoad %121 
                                 f32 %123 = OpFAdd %119 %122 
                        Private f32* %124 = OpAccessChain %40 %111 
                                              OpStore %124 %123 
                        Private f32* %125 = OpAccessChain %40 %111 
                                 f32 %126 = OpLoad %125 
                                 f32 %127 = OpFDiv %85 %126 
                        Private f32* %128 = OpAccessChain %40 %111 
                                              OpStore %128 %127 
                        Private f32* %132 = OpAccessChain %40 %111 
                                 f32 %133 = OpLoad %132 
                                bool %135 = OpFOrdLessThan %133 %134 
                                              OpStore %131 %135 
                               f32_3 %136 = OpLoad %40 
                               f32_2 %137 = OpVectorShuffle %136 %136 0 0 
                               f32_2 %140 = OpFMul %137 %139 
                               f32_3 %141 = OpLoad %40 
                               f32_3 %142 = OpVectorShuffle %141 %140 3 1 4 
                                              OpStore %40 %142 
                               f32_3 %143 = OpLoad %40 
                               f32_2 %144 = OpVectorShuffle %143 %143 0 2 
                               f32_2 %145 = OpExtInst %1 10 %144 
                               f32_3 %146 = OpLoad %40 
                               f32_3 %147 = OpVectorShuffle %146 %145 3 1 4 
                                              OpStore %40 %147 
                        Private f32* %148 = OpAccessChain %40 %81 
                                 f32 %149 = OpLoad %148 
                                 f32 %150 = OpFNegate %149 
                                 f32 %152 = OpFMul %150 %151 
                        Private f32* %153 = OpAccessChain %40 %111 
                                 f32 %154 = OpLoad %153 
                                 f32 %155 = OpFAdd %152 %154 
                        Private f32* %156 = OpAccessChain %9 %81 
                                              OpStore %156 %155 
                        Private f32* %157 = OpAccessChain %40 %81 
                                 f32 %158 = OpLoad %157 
                        Private f32* %160 = OpAccessChain %9 %159 
                                              OpStore %160 %158 
                                bool %163 = OpLoad %131 
                               f32_4 %164 = OpLoad %9 
                              bool_4 %167 = OpCompositeConstruct %163 %163 %163 %163 
                               f32_4 %168 = OpSelect %167 %164 %165 
                                              OpStore %162 %168 
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