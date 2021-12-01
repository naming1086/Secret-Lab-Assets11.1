//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/TV_Old" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(1, 10)) = 1
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.x = u_xlat0.x / u_xlat0.y;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.x = u_xlat6.x * 200.0;
    u_xlat1.x = floor(u_xlat6.x);
    u_xlat6.xy = u_xlat0.yy * vec2(6.0, 200.0);
    u_xlat1.y = floor(u_xlat6.y);
    u_xlat6.x = _TimeX * 5.5999999 + u_xlat6.x;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 1.25;
    u_xlat1.xy = u_xlat1.xy * vec2(_TimeX);
    u_xlat1.xy = u_xlat1.xy * vec2(0.00100000005, 0.00100000005);
    u_xlat9 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat9 = sin(u_xlat9);
    u_xlat9 = u_xlat9 * 43758.5469;
    u_xlat9 = fract(u_xlat9);
    u_xlat6.y = u_xlat9 + 0.5;
    u_xlat6.xy = min(u_xlat6.xy, vec2(1.0, 1.0));
    u_xlat1.x = u_xlat6.y + -0.75;
    u_xlat9 = u_xlat6.y + (-u_xlat1.x);
    u_xlat6.x = u_xlat6.x * u_xlat9 + u_xlat1.x;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0999999;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) * 2.79999995 + 1.0;
    u_xlat2.xy = u_xlat6.xx * u_xlat1.xx;
    u_xlat2.z = u_xlat6.x * u_xlat1.x + 0.0520000011;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
; Bound: 213
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %202 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %14 0 Offset 14 
                                              OpMemberDecorate %14 1 Offset 14 
                                              OpDecorate %14 Block 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %143 DescriptorSet 143 
                                              OpDecorate %143 Binding 143 
                                              OpDecorate %147 DescriptorSet 147 
                                              OpDecorate %147 Binding 147 
                                              OpDecorate %202 Location 202 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypeStruct %6 %13 
                                      %15 = OpTypePointer Uniform %14 
        Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
                                      %17 = OpTypeInt 32 1 
                                  i32 %18 = OpConstant 1 
                                      %19 = OpTypePointer Uniform %13 
                       Private f32_2* %28 = OpVariable Private 
                                      %29 = OpTypeInt 32 0 
                                  u32 %30 = OpConstant 0 
                                      %31 = OpTypePointer Private %6 
                                  u32 %34 = OpConstant 1 
                                  f32 %47 = OpConstant 3.674022E-40 
                                      %50 = OpTypeVector %6 3 
                                      %51 = OpTypePointer Private %50 
                       Private f32_3* %52 = OpVariable Private 
                                  f32 %59 = OpConstant 3.674022E-40 
                                f32_2 %60 = OpConstantComposite %59 %47 
                                  i32 %66 = OpConstant 0 
                                      %67 = OpTypePointer Uniform %6 
                                  f32 %70 = OpConstant 3.674022E-40 
                                  f32 %82 = OpConstant 3.674022E-40 
                                  f32 %95 = OpConstant 3.674022E-40 
                                f32_2 %96 = OpConstantComposite %95 %95 
                        Private f32* %100 = OpVariable Private 
                                 f32 %103 = OpConstant 3.674022E-40 
                                 f32 %104 = OpConstant 3.674022E-40 
                               f32_2 %105 = OpConstantComposite %103 %104 
                                 f32 %110 = OpConstant 3.674022E-40 
                                 f32 %115 = OpConstant 3.674022E-40 
                                 f32 %119 = OpConstant 3.674022E-40 
                               f32_2 %120 = OpConstantComposite %119 %119 
                                 f32 %124 = OpConstant 3.674022E-40 
                                     %141 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %142 = OpTypePointer UniformConstant %141 
UniformConstant read_only Texture2D* %143 = OpVariable UniformConstant 
                                     %145 = OpTypeSampler 
                                     %146 = OpTypePointer UniformConstant %145 
            UniformConstant sampler* %147 = OpVariable UniformConstant 
                                     %149 = OpTypeSampledImage %141 
                                 f32 %155 = OpConstant 3.674022E-40 
                               f32_2 %156 = OpConstantComposite %155 %155 
                                 f32 %172 = OpConstant 3.674022E-40 
                                 f32 %182 = OpConstant 3.674022E-40 
                                 f32 %197 = OpConstant 3.674022E-40 
                                 u32 %199 = OpConstant 2 
                                     %201 = OpTypePointer Output %13 
                       Output f32_4* %202 = OpVariable Output 
                                 u32 %209 = OpConstant 3 
                                     %210 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
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
                         Private f32* %32 = OpAccessChain %9 %30 
                                  f32 %33 = OpLoad %32 
                         Private f32* %35 = OpAccessChain %9 %34 
                                  f32 %36 = OpLoad %35 
                                  f32 %37 = OpFDiv %33 %36 
                         Private f32* %38 = OpAccessChain %28 %30 
                                              OpStore %38 %37 
                         Private f32* %39 = OpAccessChain %28 %30 
                                  f32 %40 = OpLoad %39 
                         Private f32* %41 = OpAccessChain %9 %30 
                                  f32 %42 = OpLoad %41 
                                  f32 %43 = OpFMul %40 %42 
                         Private f32* %44 = OpAccessChain %28 %30 
                                              OpStore %44 %43 
                         Private f32* %45 = OpAccessChain %28 %30 
                                  f32 %46 = OpLoad %45 
                                  f32 %48 = OpFMul %46 %47 
                         Private f32* %49 = OpAccessChain %28 %30 
                                              OpStore %49 %48 
                         Private f32* %53 = OpAccessChain %28 %30 
                                  f32 %54 = OpLoad %53 
                                  f32 %55 = OpExtInst %1 8 %54 
                         Private f32* %56 = OpAccessChain %52 %30 
                                              OpStore %56 %55 
                                f32_2 %57 = OpLoad %9 
                                f32_2 %58 = OpVectorShuffle %57 %57 1 1 
                                f32_2 %61 = OpFMul %58 %60 
                                              OpStore %28 %61 
                         Private f32* %62 = OpAccessChain %28 %34 
                                  f32 %63 = OpLoad %62 
                                  f32 %64 = OpExtInst %1 8 %63 
                         Private f32* %65 = OpAccessChain %52 %34 
                                              OpStore %65 %64 
                         Uniform f32* %68 = OpAccessChain %16 %66 
                                  f32 %69 = OpLoad %68 
                                  f32 %71 = OpFMul %69 %70 
                         Private f32* %72 = OpAccessChain %28 %30 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpFAdd %71 %73 
                         Private f32* %75 = OpAccessChain %28 %30 
                                              OpStore %75 %74 
                         Private f32* %76 = OpAccessChain %28 %30 
                                  f32 %77 = OpLoad %76 
                                  f32 %78 = OpExtInst %1 13 %77 
                         Private f32* %79 = OpAccessChain %28 %30 
                                              OpStore %79 %78 
                         Private f32* %80 = OpAccessChain %28 %30 
                                  f32 %81 = OpLoad %80 
                                  f32 %83 = OpFAdd %81 %82 
                         Private f32* %84 = OpAccessChain %28 %30 
                                              OpStore %84 %83 
                                f32_3 %85 = OpLoad %52 
                                f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                         Uniform f32* %87 = OpAccessChain %16 %66 
                                  f32 %88 = OpLoad %87 
                                f32_2 %89 = OpCompositeConstruct %88 %88 
                                f32_2 %90 = OpFMul %86 %89 
                                f32_3 %91 = OpLoad %52 
                                f32_3 %92 = OpVectorShuffle %91 %90 3 4 2 
                                              OpStore %52 %92 
                                f32_3 %93 = OpLoad %52 
                                f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                f32_2 %97 = OpFMul %94 %96 
                                f32_3 %98 = OpLoad %52 
                                f32_3 %99 = OpVectorShuffle %98 %97 3 4 2 
                                              OpStore %52 %99 
                               f32_3 %101 = OpLoad %52 
                               f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                 f32 %106 = OpDot %102 %105 
                                              OpStore %100 %106 
                                 f32 %107 = OpLoad %100 
                                 f32 %108 = OpExtInst %1 13 %107 
                                              OpStore %100 %108 
                                 f32 %109 = OpLoad %100 
                                 f32 %111 = OpFMul %109 %110 
                                              OpStore %100 %111 
                                 f32 %112 = OpLoad %100 
                                 f32 %113 = OpExtInst %1 10 %112 
                                              OpStore %100 %113 
                                 f32 %114 = OpLoad %100 
                                 f32 %116 = OpFAdd %114 %115 
                        Private f32* %117 = OpAccessChain %28 %34 
                                              OpStore %117 %116 
                               f32_2 %118 = OpLoad %28 
                               f32_2 %121 = OpExtInst %1 37 %118 %120 
                                              OpStore %28 %121 
                        Private f32* %122 = OpAccessChain %28 %34 
                                 f32 %123 = OpLoad %122 
                                 f32 %125 = OpFAdd %123 %124 
                        Private f32* %126 = OpAccessChain %52 %30 
                                              OpStore %126 %125 
                        Private f32* %127 = OpAccessChain %28 %34 
                                 f32 %128 = OpLoad %127 
                        Private f32* %129 = OpAccessChain %52 %30 
                                 f32 %130 = OpLoad %129 
                                 f32 %131 = OpFNegate %130 
                                 f32 %132 = OpFAdd %128 %131 
                                              OpStore %100 %132 
                        Private f32* %133 = OpAccessChain %28 %30 
                                 f32 %134 = OpLoad %133 
                                 f32 %135 = OpLoad %100 
                                 f32 %136 = OpFMul %134 %135 
                        Private f32* %137 = OpAccessChain %52 %30 
                                 f32 %138 = OpLoad %137 
                                 f32 %139 = OpFAdd %136 %138 
                        Private f32* %140 = OpAccessChain %28 %30 
                                              OpStore %140 %139 
                 read_only Texture2D %144 = OpLoad %143 
                             sampler %148 = OpLoad %147 
          read_only Texture2DSampled %150 = OpSampledImage %144 %148 
                               f32_2 %151 = OpLoad %9 
                               f32_4 %152 = OpImageSampleImplicitLod %150 %151 
                                 f32 %153 = OpCompositeExtract %152 0 
                                              OpStore %100 %153 
                               f32_2 %154 = OpLoad %9 
                               f32_2 %157 = OpFAdd %154 %156 
                                              OpStore %9 %157 
                               f32_2 %158 = OpLoad %9 
                               f32_2 %159 = OpLoad %9 
                                 f32 %160 = OpDot %158 %159 
                        Private f32* %161 = OpAccessChain %9 %30 
                                              OpStore %161 %160 
                        Private f32* %162 = OpAccessChain %9 %30 
                                 f32 %163 = OpLoad %162 
                                 f32 %164 = OpExtInst %1 31 %163 
                        Private f32* %165 = OpAccessChain %9 %30 
                                              OpStore %165 %164 
                        Private f32* %166 = OpAccessChain %9 %30 
                                 f32 %167 = OpLoad %166 
                                 f32 %168 = OpExtInst %1 30 %167 
                        Private f32* %169 = OpAccessChain %9 %30 
                                              OpStore %169 %168 
                        Private f32* %170 = OpAccessChain %9 %30 
                                 f32 %171 = OpLoad %170 
                                 f32 %173 = OpFMul %171 %172 
                        Private f32* %174 = OpAccessChain %9 %30 
                                              OpStore %174 %173 
                        Private f32* %175 = OpAccessChain %9 %30 
                                 f32 %176 = OpLoad %175 
                                 f32 %177 = OpExtInst %1 29 %176 
                        Private f32* %178 = OpAccessChain %9 %30 
                                              OpStore %178 %177 
                        Private f32* %179 = OpAccessChain %9 %30 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpFNegate %180 
                                 f32 %183 = OpFMul %181 %182 
                                 f32 %184 = OpFAdd %183 %119 
                        Private f32* %185 = OpAccessChain %9 %30 
                                              OpStore %185 %184 
                                 f32 %186 = OpLoad %100 
                               f32_2 %187 = OpCompositeConstruct %186 %186 
                               f32_2 %188 = OpLoad %28 
                               f32_2 %189 = OpVectorShuffle %188 %188 0 0 
                               f32_2 %190 = OpFMul %187 %189 
                               f32_3 %191 = OpLoad %52 
                               f32_3 %192 = OpVectorShuffle %191 %190 3 4 2 
                                              OpStore %52 %192 
                        Private f32* %193 = OpAccessChain %28 %30 
                                 f32 %194 = OpLoad %193 
                                 f32 %195 = OpLoad %100 
                                 f32 %196 = OpFMul %194 %195 
                                 f32 %198 = OpFAdd %196 %197 
                        Private f32* %200 = OpAccessChain %52 %199 
                                              OpStore %200 %198 
                               f32_2 %203 = OpLoad %9 
                               f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
                               f32_3 %205 = OpLoad %52 
                               f32_3 %206 = OpFMul %204 %205 
                               f32_4 %207 = OpLoad %202 
                               f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                              OpStore %202 %208 
                         Output f32* %211 = OpAccessChain %202 %209 
                                              OpStore %211 %119 
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