//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Skybox/Cubemap" {
Properties {
_Tint ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_Exposure ("Exposure", Range(0, 8)) = 1
_Rotation ("Rotation", Range(0, 360)) = 0
_Tex ("Cubemap   (HDR)", Cube) = "grey" { }
}
SubShader {
 Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
  ZWrite Off
  Cull Off
  GpuProgramID 36324
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
uniform 	float _Rotation;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.x = _Rotation * 0.0174532942;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.x = (-u_xlat0.x);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat2.zy, in_POSITION0.xz);
    u_xlat3 = dot(u_xlat2.yx, in_POSITION0.xz);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * vec4(u_xlat3) + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_POSITION0.xyz;
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
uniform 	vec4 _Tex_HDR;
uniform 	vec4 _Tint;
uniform 	float _Exposure;
UNITY_LOCATION(0) uniform  samplerCube _Tex;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat3;
void main()
{
    u_xlat0 = texture(_Tex, vs_TEXCOORD0.xyz);
    u_xlat3 = u_xlat0.w + -1.0;
    u_xlat3 = _Tex_HDR.w * u_xlat3 + 1.0;
    u_xlat3 = log2(u_xlat3);
    u_xlat3 = u_xlat3 * _Tex_HDR.y;
    u_xlat3 = exp2(u_xlat3);
    u_xlat3 = u_xlat3 * _Tex_HDR.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * _Tint.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Exposure);
    SV_Target0.xyz = u_xlat0.xyz * vec3(4.5947938, 4.5947938, 4.5947938);
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
                                                   OpEntryPoint Vertex %4 "main" %55 %115 %126 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %12 ArrayStride 12 
                                                   OpDecorate %13 ArrayStride 13 
                                                   OpMemberDecorate %14 0 Offset 14 
                                                   OpMemberDecorate %14 1 Offset 14 
                                                   OpMemberDecorate %14 2 Offset 14 
                                                   OpDecorate %14 Block 
                                                   OpDecorate %16 DescriptorSet 16 
                                                   OpDecorate %16 Binding 16 
                                                   OpDecorate %55 Location 55 
                                                   OpMemberDecorate %113 0 BuiltIn 113 
                                                   OpMemberDecorate %113 1 BuiltIn 113 
                                                   OpMemberDecorate %113 2 BuiltIn 113 
                                                   OpDecorate %113 Block 
                                                   OpDecorate vs_TEXCOORD0 Location 126 
                                            %2 = OpTypeVoid 
                                            %3 = OpTypeFunction %2 
                                            %6 = OpTypeFloat 32 
                                            %7 = OpTypeVector %6 4 
                                            %8 = OpTypePointer Private %7 
                             Private f32_4* %9 = OpVariable Private 
                                           %10 = OpTypeInt 32 0 
                                       u32 %11 = OpConstant 4 
                                           %12 = OpTypeArray %7 %11 
                                           %13 = OpTypeArray %7 %11 
                                           %14 = OpTypeStruct %12 %13 %6 
                                           %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %16 = OpVariable Uniform 
                                           %17 = OpTypeInt 32 1 
                                       i32 %18 = OpConstant 2 
                                           %19 = OpTypePointer Uniform %6 
                                       f32 %22 = OpConstant 3.674022E-40 
                                       u32 %24 = OpConstant 0 
                                           %25 = OpTypePointer Private %6 
                            Private f32_4* %27 = OpVariable Private 
                                           %36 = OpTypeVector %6 3 
                                           %37 = OpTypePointer Private %36 
                            Private f32_3* %38 = OpVariable Private 
                                       u32 %45 = OpConstant 1 
                                       u32 %49 = OpConstant 2 
                                           %51 = OpTypeVector %6 2 
                                           %54 = OpTypePointer Input %7 
                              Input f32_4* %55 = OpVariable Input 
                              Private f32* %60 = OpVariable Private 
                                       i32 %68 = OpConstant 0 
                                       i32 %69 = OpConstant 1 
                                           %70 = OpTypePointer Uniform %7 
                                       i32 %89 = OpConstant 3 
                                          %112 = OpTypeArray %6 %45 
                                          %113 = OpTypeStruct %7 %6 %112 
                                          %114 = OpTypePointer Output %113 
     Output struct {f32_4; f32; f32[1];}* %115 = OpVariable Output 
                                          %123 = OpTypePointer Output %7 
                                          %125 = OpTypePointer Output %36 
                    Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                          %129 = OpTypePointer Output %6 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                              Uniform f32* %20 = OpAccessChain %16 %18 
                                       f32 %21 = OpLoad %20 
                                       f32 %23 = OpFMul %21 %22 
                              Private f32* %26 = OpAccessChain %9 %24 
                                                   OpStore %26 %23 
                              Private f32* %28 = OpAccessChain %9 %24 
                                       f32 %29 = OpLoad %28 
                                       f32 %30 = OpExtInst %1 14 %29 
                              Private f32* %31 = OpAccessChain %27 %24 
                                                   OpStore %31 %30 
                              Private f32* %32 = OpAccessChain %9 %24 
                                       f32 %33 = OpLoad %32 
                                       f32 %34 = OpExtInst %1 13 %33 
                              Private f32* %35 = OpAccessChain %9 %24 
                                                   OpStore %35 %34 
                              Private f32* %39 = OpAccessChain %9 %24 
                                       f32 %40 = OpLoad %39 
                                       f32 %41 = OpFNegate %40 
                              Private f32* %42 = OpAccessChain %38 %24 
                                                   OpStore %42 %41 
                              Private f32* %43 = OpAccessChain %27 %24 
                                       f32 %44 = OpLoad %43 
                              Private f32* %46 = OpAccessChain %38 %45 
                                                   OpStore %46 %44 
                              Private f32* %47 = OpAccessChain %9 %24 
                                       f32 %48 = OpLoad %47 
                              Private f32* %50 = OpAccessChain %38 %49 
                                                   OpStore %50 %48 
                                     f32_3 %52 = OpLoad %38 
                                     f32_2 %53 = OpVectorShuffle %52 %52 2 1 
                                     f32_4 %56 = OpLoad %55 
                                     f32_2 %57 = OpVectorShuffle %56 %56 0 2 
                                       f32 %58 = OpDot %53 %57 
                              Private f32* %59 = OpAccessChain %9 %24 
                                                   OpStore %59 %58 
                                     f32_3 %61 = OpLoad %38 
                                     f32_2 %62 = OpVectorShuffle %61 %61 1 0 
                                     f32_4 %63 = OpLoad %55 
                                     f32_2 %64 = OpVectorShuffle %63 %63 0 2 
                                       f32 %65 = OpDot %62 %64 
                                                   OpStore %60 %65 
                                     f32_4 %66 = OpLoad %55 
                                     f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                            Uniform f32_4* %71 = OpAccessChain %16 %68 %69 
                                     f32_4 %72 = OpLoad %71 
                                     f32_4 %73 = OpFMul %67 %72 
                                                   OpStore %27 %73 
                            Uniform f32_4* %74 = OpAccessChain %16 %68 %68 
                                     f32_4 %75 = OpLoad %74 
                                       f32 %76 = OpLoad %60 
                                     f32_4 %77 = OpCompositeConstruct %76 %76 %76 %76 
                                     f32_4 %78 = OpFMul %75 %77 
                                     f32_4 %79 = OpLoad %27 
                                     f32_4 %80 = OpFAdd %78 %79 
                                                   OpStore %27 %80 
                            Uniform f32_4* %81 = OpAccessChain %16 %68 %18 
                                     f32_4 %82 = OpLoad %81 
                                     f32_4 %83 = OpLoad %9 
                                     f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                     f32_4 %85 = OpFMul %82 %84 
                                     f32_4 %86 = OpLoad %27 
                                     f32_4 %87 = OpFAdd %85 %86 
                                                   OpStore %9 %87 
                                     f32_4 %88 = OpLoad %9 
                            Uniform f32_4* %90 = OpAccessChain %16 %68 %89 
                                     f32_4 %91 = OpLoad %90 
                                     f32_4 %92 = OpFAdd %88 %91 
                                                   OpStore %9 %92 
                                     f32_4 %93 = OpLoad %9 
                                     f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                            Uniform f32_4* %95 = OpAccessChain %16 %69 %69 
                                     f32_4 %96 = OpLoad %95 
                                     f32_4 %97 = OpFMul %94 %96 
                                                   OpStore %27 %97 
                            Uniform f32_4* %98 = OpAccessChain %16 %69 %68 
                                     f32_4 %99 = OpLoad %98 
                                    f32_4 %100 = OpLoad %9 
                                    f32_4 %101 = OpVectorShuffle %100 %100 0 0 0 0 
                                    f32_4 %102 = OpFMul %99 %101 
                                    f32_4 %103 = OpLoad %27 
                                    f32_4 %104 = OpFAdd %102 %103 
                                                   OpStore %27 %104 
                           Uniform f32_4* %105 = OpAccessChain %16 %69 %18 
                                    f32_4 %106 = OpLoad %105 
                                    f32_4 %107 = OpLoad %9 
                                    f32_4 %108 = OpVectorShuffle %107 %107 2 2 2 2 
                                    f32_4 %109 = OpFMul %106 %108 
                                    f32_4 %110 = OpLoad %27 
                                    f32_4 %111 = OpFAdd %109 %110 
                                                   OpStore %27 %111 
                           Uniform f32_4* %116 = OpAccessChain %16 %69 %89 
                                    f32_4 %117 = OpLoad %116 
                                    f32_4 %118 = OpLoad %9 
                                    f32_4 %119 = OpVectorShuffle %118 %118 3 3 3 3 
                                    f32_4 %120 = OpFMul %117 %119 
                                    f32_4 %121 = OpLoad %27 
                                    f32_4 %122 = OpFAdd %120 %121 
                            Output f32_4* %124 = OpAccessChain %115 %68 
                                                   OpStore %124 %122 
                                    f32_4 %127 = OpLoad %55 
                                    f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                                   OpStore vs_TEXCOORD0 %128 
                              Output f32* %130 = OpAccessChain %115 %68 %45 
                                      f32 %131 = OpLoad %130 
                                      f32 %132 = OpFNegate %131 
                              Output f32* %133 = OpAccessChain %115 %68 %45 
                                                   OpStore %133 %132 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %86 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate %12 DescriptorSet 12 
                                               OpDecorate %12 Binding 12 
                                               OpDecorate %16 DescriptorSet 16 
                                               OpDecorate %16 Binding 16 
                                               OpDecorate vs_TEXCOORD0 Location 22 
                                               OpMemberDecorate %33 0 Offset 33 
                                               OpMemberDecorate %33 1 Offset 33 
                                               OpMemberDecorate %33 2 Offset 33 
                                               OpDecorate %33 Block 
                                               OpDecorate %35 DescriptorSet 35 
                                               OpDecorate %35 Binding 35 
                                               OpDecorate %86 Location 86 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                       %25 = OpTypePointer Private %6 
                          Private f32* %26 = OpVariable Private 
                                       %27 = OpTypeInt 32 0 
                                   u32 %28 = OpConstant 3 
                                   f32 %31 = OpConstant 3.674022E-40 
                                       %33 = OpTypeStruct %7 %7 %6 
                                       %34 = OpTypePointer Uniform %33 
  Uniform struct {f32_4; f32_4; f32;}* %35 = OpVariable Uniform 
                                       %36 = OpTypeInt 32 1 
                                   i32 %37 = OpConstant 0 
                                       %38 = OpTypePointer Uniform %6 
                                   f32 %43 = OpConstant 3.674022E-40 
                                   u32 %48 = OpConstant 1 
                                   u32 %55 = OpConstant 0 
                                   i32 %68 = OpConstant 1 
                                       %69 = OpTypePointer Uniform %7 
                                   i32 %78 = OpConstant 2 
                                       %85 = OpTypePointer Output %7 
                         Output f32_4* %86 = OpVariable Output 
                                   f32 %89 = OpConstant 3.674022E-40 
                                 f32_3 %90 = OpConstantComposite %89 %89 %89 
                                       %94 = OpTypePointer Output %6 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                          Private f32* %29 = OpAccessChain %9 %28 
                                   f32 %30 = OpLoad %29 
                                   f32 %32 = OpFAdd %30 %31 
                                               OpStore %26 %32 
                          Uniform f32* %39 = OpAccessChain %35 %37 %28 
                                   f32 %40 = OpLoad %39 
                                   f32 %41 = OpLoad %26 
                                   f32 %42 = OpFMul %40 %41 
                                   f32 %44 = OpFAdd %42 %43 
                                               OpStore %26 %44 
                                   f32 %45 = OpLoad %26 
                                   f32 %46 = OpExtInst %1 30 %45 
                                               OpStore %26 %46 
                                   f32 %47 = OpLoad %26 
                          Uniform f32* %49 = OpAccessChain %35 %37 %48 
                                   f32 %50 = OpLoad %49 
                                   f32 %51 = OpFMul %47 %50 
                                               OpStore %26 %51 
                                   f32 %52 = OpLoad %26 
                                   f32 %53 = OpExtInst %1 29 %52 
                                               OpStore %26 %53 
                                   f32 %54 = OpLoad %26 
                          Uniform f32* %56 = OpAccessChain %35 %37 %55 
                                   f32 %57 = OpLoad %56 
                                   f32 %58 = OpFMul %54 %57 
                                               OpStore %26 %58 
                                 f32_4 %59 = OpLoad %9 
                                 f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                   f32 %61 = OpLoad %26 
                                 f32_3 %62 = OpCompositeConstruct %61 %61 %61 
                                 f32_3 %63 = OpFMul %60 %62 
                                 f32_4 %64 = OpLoad %9 
                                 f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                               OpStore %9 %65 
                                 f32_4 %66 = OpLoad %9 
                                 f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                        Uniform f32_4* %70 = OpAccessChain %35 %68 
                                 f32_4 %71 = OpLoad %70 
                                 f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                 f32_3 %73 = OpFMul %67 %72 
                                 f32_4 %74 = OpLoad %9 
                                 f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                               OpStore %9 %75 
                                 f32_4 %76 = OpLoad %9 
                                 f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                          Uniform f32* %79 = OpAccessChain %35 %78 
                                   f32 %80 = OpLoad %79 
                                 f32_3 %81 = OpCompositeConstruct %80 %80 %80 
                                 f32_3 %82 = OpFMul %77 %81 
                                 f32_4 %83 = OpLoad %9 
                                 f32_4 %84 = OpVectorShuffle %83 %82 4 5 6 3 
                                               OpStore %9 %84 
                                 f32_4 %87 = OpLoad %9 
                                 f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                 f32_3 %91 = OpFMul %88 %90 
                                 f32_4 %92 = OpLoad %86 
                                 f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                               OpStore %86 %93 
                           Output f32* %95 = OpAccessChain %86 %28 
                                               OpStore %95 %43 
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