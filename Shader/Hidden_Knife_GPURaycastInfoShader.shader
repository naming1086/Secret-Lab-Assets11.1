//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Knife/GPURaycastInfoShader" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 64838
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
uniform 	int ObjectID;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlati1 = ObjectID + 1;
    vs_TEXCOORD2 = float(u_xlati1);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  float vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
float u_xlat0;
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz;
    SV_Target0.w = 1.0;
    u_xlat0 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0 = inversesqrt(u_xlat0);
    SV_Target1.xyz = vec3(u_xlat0) * vs_TEXCOORD1.xyz;
    SV_Target1.w = 1.0;
    SV_Target2.x = vs_TEXCOORD2;
    SV_Target2.yzw = vec3(0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 138
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %44 %60 %81 %98 %124 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                   OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %19 0 Offset 19 
                                                   OpMemberDecorate %19 1 Offset 19 
                                                   OpMemberDecorate %19 2 Offset 19 
                                                   OpDecorate %19 Block 
                                                   OpDecorate %21 DescriptorSet 21 
                                                   OpDecorate %21 Binding 21 
                                                   OpDecorate vs_TEXCOORD0 Location 44 
                                                   OpDecorate %60 Location 60 
                                                   OpDecorate vs_TEXCOORD1 Location 81 
                                                   OpDecorate vs_TEXCOORD2 Location 98 
                                                   OpMemberDecorate %122 0 BuiltIn 122 
                                                   OpMemberDecorate %122 1 BuiltIn 122 
                                                   OpMemberDecorate %122 2 BuiltIn 122 
                                                   OpDecorate %122 Block 
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
                                           %18 = OpTypeInt 32 1 
                                           %19 = OpTypeStruct %16 %17 %18 
                                           %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; i32;}* %21 = OpVariable Uniform 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                           %43 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                       i32 %45 = OpConstant 3 
                            Private f32_4* %57 = OpVariable Private 
                                           %58 = OpTypeVector %6 3 
                                           %59 = OpTypePointer Input %58 
                              Input f32_3* %60 = OpVariable Input 
                                           %80 = OpTypePointer Output %58 
                    Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                           %91 = OpTypePointer Private %18 
                              Private i32* %92 = OpVariable Private 
                                           %93 = OpTypePointer Uniform %18 
                                           %97 = OpTypePointer Output %6 
                      Output f32* vs_TEXCOORD2 = OpVariable Output 
                                      u32 %120 = OpConstant 1 
                                          %121 = OpTypeArray %6 %120 
                                          %122 = OpTypeStruct %7 %6 %121 
                                          %123 = OpTypePointer Output %122 
     Output struct {f32_4; f32; f32[1];}* %124 = OpVariable Output 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                                     f32_4 %12 = OpLoad %11 
                                     f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                            Uniform f32_4* %25 = OpAccessChain %21 %22 %23 
                                     f32_4 %26 = OpLoad %25 
                                     f32_4 %27 = OpFMul %13 %26 
                                                   OpStore %9 %27 
                            Uniform f32_4* %28 = OpAccessChain %21 %22 %22 
                                     f32_4 %29 = OpLoad %28 
                                     f32_4 %30 = OpLoad %11 
                                     f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                     f32_4 %32 = OpFMul %29 %31 
                                     f32_4 %33 = OpLoad %9 
                                     f32_4 %34 = OpFAdd %32 %33 
                                                   OpStore %9 %34 
                            Uniform f32_4* %36 = OpAccessChain %21 %22 %35 
                                     f32_4 %37 = OpLoad %36 
                                     f32_4 %38 = OpLoad %11 
                                     f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                     f32_4 %40 = OpFMul %37 %39 
                                     f32_4 %41 = OpLoad %9 
                                     f32_4 %42 = OpFAdd %40 %41 
                                                   OpStore %9 %42 
                            Uniform f32_4* %46 = OpAccessChain %21 %22 %45 
                                     f32_4 %47 = OpLoad %46 
                                     f32_4 %48 = OpLoad %11 
                                     f32_4 %49 = OpVectorShuffle %48 %48 3 3 3 3 
                                     f32_4 %50 = OpFMul %47 %49 
                                     f32_4 %51 = OpLoad %9 
                                     f32_4 %52 = OpFAdd %50 %51 
                                                   OpStore vs_TEXCOORD0 %52 
                                     f32_4 %53 = OpLoad %9 
                            Uniform f32_4* %54 = OpAccessChain %21 %22 %45 
                                     f32_4 %55 = OpLoad %54 
                                     f32_4 %56 = OpFAdd %53 %55 
                                                   OpStore %9 %56 
                                     f32_3 %61 = OpLoad %60 
                                     f32_3 %62 = OpVectorShuffle %61 %61 1 1 1 
                            Uniform f32_4* %63 = OpAccessChain %21 %22 %23 
                                     f32_4 %64 = OpLoad %63 
                                     f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                     f32_3 %66 = OpFMul %62 %65 
                                     f32_4 %67 = OpLoad %57 
                                     f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                   OpStore %57 %68 
                            Uniform f32_4* %69 = OpAccessChain %21 %22 %22 
                                     f32_4 %70 = OpLoad %69 
                                     f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                     f32_3 %72 = OpLoad %60 
                                     f32_3 %73 = OpVectorShuffle %72 %72 0 0 0 
                                     f32_3 %74 = OpFMul %71 %73 
                                     f32_4 %75 = OpLoad %57 
                                     f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                     f32_3 %77 = OpFAdd %74 %76 
                                     f32_4 %78 = OpLoad %57 
                                     f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                   OpStore %57 %79 
                            Uniform f32_4* %82 = OpAccessChain %21 %22 %35 
                                     f32_4 %83 = OpLoad %82 
                                     f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                     f32_3 %85 = OpLoad %60 
                                     f32_3 %86 = OpVectorShuffle %85 %85 2 2 2 
                                     f32_3 %87 = OpFMul %84 %86 
                                     f32_4 %88 = OpLoad %57 
                                     f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                     f32_3 %90 = OpFAdd %87 %89 
                                                   OpStore vs_TEXCOORD1 %90 
                              Uniform i32* %94 = OpAccessChain %21 %35 
                                       i32 %95 = OpLoad %94 
                                       i32 %96 = OpIAdd %95 %23 
                                                   OpStore %92 %96 
                                       i32 %99 = OpLoad %92 
                                      f32 %100 = OpConvertSToF %99 
                                                   OpStore vs_TEXCOORD2 %100 
                                    f32_4 %101 = OpLoad %9 
                                    f32_4 %102 = OpVectorShuffle %101 %101 1 1 1 1 
                           Uniform f32_4* %103 = OpAccessChain %21 %23 %23 
                                    f32_4 %104 = OpLoad %103 
                                    f32_4 %105 = OpFMul %102 %104 
                                                   OpStore %57 %105 
                           Uniform f32_4* %106 = OpAccessChain %21 %23 %22 
                                    f32_4 %107 = OpLoad %106 
                                    f32_4 %108 = OpLoad %9 
                                    f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                    f32_4 %110 = OpFMul %107 %109 
                                    f32_4 %111 = OpLoad %57 
                                    f32_4 %112 = OpFAdd %110 %111 
                                                   OpStore %57 %112 
                           Uniform f32_4* %113 = OpAccessChain %21 %23 %35 
                                    f32_4 %114 = OpLoad %113 
                                    f32_4 %115 = OpLoad %9 
                                    f32_4 %116 = OpVectorShuffle %115 %115 2 2 2 2 
                                    f32_4 %117 = OpFMul %114 %116 
                                    f32_4 %118 = OpLoad %57 
                                    f32_4 %119 = OpFAdd %117 %118 
                                                   OpStore %57 %119 
                           Uniform f32_4* %125 = OpAccessChain %21 %23 %45 
                                    f32_4 %126 = OpLoad %125 
                                    f32_4 %127 = OpLoad %9 
                                    f32_4 %128 = OpVectorShuffle %127 %127 3 3 3 3 
                                    f32_4 %129 = OpFMul %126 %128 
                                    f32_4 %130 = OpLoad %57 
                                    f32_4 %131 = OpFAdd %129 %130 
                            Output f32_4* %132 = OpAccessChain %124 %22 
                                                   OpStore %132 %131 
                              Output f32* %133 = OpAccessChain %124 %22 %120 
                                      f32 %134 = OpLoad %133 
                                      f32 %135 = OpFNegate %134 
                              Output f32* %136 = OpAccessChain %124 %22 %120 
                                                   OpStore %136 %135 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 50
; Schema: 0
                              OpCapability Shader 
                       %1 = OpExtInstImport "GLSL.std.450" 
                              OpMemoryModel Logical GLSL450 
                              OpEntryPoint Fragment %4 "main" %9 %11 %25 %31 %39 %41 
                              OpExecutionMode %4 OriginUpperLeft 
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                              OpDecorate vs_TEXCOORD1 Location 25 
                              OpDecorate %31 Location 31 
                              OpDecorate %39 Location 39 
                              OpDecorate vs_TEXCOORD2 Location 41 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                      %12 = OpTypeVector %6 3 
                  f32 %17 = OpConstant 3.674022E-40 
                      %18 = OpTypeInt 32 0 
                  u32 %19 = OpConstant 3 
                      %20 = OpTypePointer Output %6 
                      %22 = OpTypePointer Private %6 
         Private f32* %23 = OpVariable Private 
                      %24 = OpTypePointer Input %12 
Input f32_3* vs_TEXCOORD1 = OpVariable Input 
        Output f32_4* %31 = OpVariable Output 
        Output f32_4* %39 = OpVariable Output 
                      %40 = OpTypePointer Input %6 
  Input f32* vs_TEXCOORD2 = OpVariable Input 
                  u32 %43 = OpConstant 0 
                  f32 %45 = OpConstant 3.674022E-40 
                f32_3 %46 = OpConstantComposite %45 %45 %17 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %13 = OpLoad vs_TEXCOORD0 
                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                f32_4 %15 = OpLoad %9 
                f32_4 %16 = OpVectorShuffle %15 %14 4 5 6 3 
                              OpStore %9 %16 
          Output f32* %21 = OpAccessChain %9 %19 
                              OpStore %21 %17 
                f32_3 %26 = OpLoad vs_TEXCOORD1 
                f32_3 %27 = OpLoad vs_TEXCOORD1 
                  f32 %28 = OpDot %26 %27 
                              OpStore %23 %28 
                  f32 %29 = OpLoad %23 
                  f32 %30 = OpExtInst %1 32 %29 
                              OpStore %23 %30 
                  f32 %32 = OpLoad %23 
                f32_3 %33 = OpCompositeConstruct %32 %32 %32 
                f32_3 %34 = OpLoad vs_TEXCOORD1 
                f32_3 %35 = OpFMul %33 %34 
                f32_4 %36 = OpLoad %31 
                f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                              OpStore %31 %37 
          Output f32* %38 = OpAccessChain %31 %19 
                              OpStore %38 %17 
                  f32 %42 = OpLoad vs_TEXCOORD2 
          Output f32* %44 = OpAccessChain %39 %43 
                              OpStore %44 %42 
                f32_4 %47 = OpLoad %39 
                f32_4 %48 = OpVectorShuffle %47 %46 0 4 5 6 
                              OpStore %39 %48 
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