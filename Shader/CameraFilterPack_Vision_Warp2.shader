//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Warp2" {
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
  GpuProgramID 10242
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
uniform 	float _Value3;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat4;
bool u_xlatb4;
float u_xlat6;
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
    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat6 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = u_xlat6 + (-_Value);
    u_xlat1.x = _Value + -0.0500000007;
    u_xlat1.x = u_xlat1.x + (-_Value2);
    u_xlat1.x = u_xlat1.x + (-_Value);
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat1.x = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = (-u_xlat1.x) * u_xlat6 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat6;
    u_xlat0.xy = (-u_xlat4.xx) * vec2(vec2(_Value3, _Value3)) + u_xlat0.xy;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 217
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %209 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %15 0 Offset 15 
                                                     OpMemberDecorate %15 1 Offset 15 
                                                     OpMemberDecorate %15 2 Offset 15 
                                                     OpMemberDecorate %15 3 Offset 15 
                                                     OpMemberDecorate %15 4 Offset 15 
                                                     OpDecorate %15 Block 
                                                     OpDecorate %17 DescriptorSet 17 
                                                     OpDecorate %17 Binding 17 
                                                     OpDecorate %196 DescriptorSet 196 
                                                     OpDecorate %196 Binding 196 
                                                     OpDecorate %200 DescriptorSet 200 
                                                     OpDecorate %200 Binding 200 
                                                     OpDecorate %209 Location 209 
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
                                             %15 = OpTypeStruct %6 %6 %6 %6 %14 
                                             %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                             %18 = OpTypeInt 32 1 
                                         i32 %19 = OpConstant 4 
                                             %20 = OpTypePointer Uniform %14 
                                             %31 = OpTypePointer Private %10 
                              Private f32_2* %32 = OpVariable Private 
                                         f32 %35 = OpConstant 3.674022E-40 
                                       f32_2 %36 = OpConstantComposite %35 %35 
                                             %43 = OpTypeInt 32 0 
                                         u32 %44 = OpConstant 0 
                                             %45 = OpTypePointer Private %6 
                                         i32 %51 = OpConstant 0 
                                             %52 = OpTypePointer Uniform %6 
                                         f32 %56 = OpConstant 3.674022E-40 
                                         f32 %64 = OpConstant 3.674022E-40 
                                Private f32* %77 = OpVariable Private 
                                         f32 %80 = OpConstant 3.674022E-40 
                                             %82 = OpTypeBool 
                                             %83 = OpTypePointer Private %82 
                               Private bool* %84 = OpVariable Private 
                                         f32 %85 = OpConstant 3.674022E-40 
                              Private f32_2* %89 = OpVariable Private 
                                             %98 = OpTypePointer Function %6 
                                        f32 %102 = OpConstant 3.674022E-40 
                                        f32 %111 = OpConstant 3.674022E-40 
                                      f32_2 %112 = OpConstantComposite %111 %111 
                                        i32 %120 = OpConstant 1 
                                        f32 %127 = OpConstant 3.674022E-40 
                                        i32 %132 = OpConstant 2 
                                        f32 %154 = OpConstant 3.674022E-40 
                                        f32 %157 = OpConstant 3.674022E-40 
                                        f32 %159 = OpConstant 3.674022E-40 
                                        i32 %179 = OpConstant 3 
                                            %194 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %195 = OpTypePointer UniformConstant %194 
       UniformConstant read_only Texture2D* %196 = OpVariable UniformConstant 
                                            %198 = OpTypeSampler 
                                            %199 = OpTypePointer UniformConstant %198 
                   UniformConstant sampler* %200 = OpVariable UniformConstant 
                                            %202 = OpTypeSampledImage %194 
                                            %208 = OpTypePointer Output %14 
                              Output f32_4* %209 = OpVariable Output 
                                        u32 %213 = OpConstant 3 
                                            %214 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %99 = OpVariable Function 
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
                                       f32_3 %33 = OpLoad %9 
                                       f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                       f32_2 %37 = OpFAdd %34 %36 
                                                     OpStore %32 %37 
                                       f32_2 %38 = OpLoad %32 
                                       f32_2 %39 = OpExtInst %1 4 %38 
                                       f32_2 %40 = OpLoad %32 
                                       f32_2 %41 = OpExtInst %1 4 %40 
                                         f32 %42 = OpDot %39 %41 
                                Private f32* %46 = OpAccessChain %32 %44 
                                                     OpStore %46 %42 
                                Private f32* %47 = OpAccessChain %32 %44 
                                         f32 %48 = OpLoad %47 
                                         f32 %49 = OpExtInst %1 31 %48 
                                Private f32* %50 = OpAccessChain %32 %44 
                                                     OpStore %50 %49 
                                Uniform f32* %53 = OpAccessChain %17 %51 
                                         f32 %54 = OpLoad %53 
                                         f32 %55 = OpFNegate %54 
                                         f32 %57 = OpFMul %55 %56 
                                Private f32* %58 = OpAccessChain %32 %44 
                                         f32 %59 = OpLoad %58 
                                         f32 %60 = OpFAdd %57 %59 
                                Private f32* %61 = OpAccessChain %32 %44 
                                                     OpStore %61 %60 
                                Private f32* %62 = OpAccessChain %32 %44 
                                         f32 %63 = OpLoad %62 
                                         f32 %65 = OpFMul %63 %64 
                                Private f32* %66 = OpAccessChain %32 %44 
                                                     OpStore %66 %65 
                                Private f32* %67 = OpAccessChain %32 %44 
                                         f32 %68 = OpLoad %67 
                                         f32 %69 = OpExtInst %1 13 %68 
                                Private f32* %70 = OpAccessChain %32 %44 
                                                     OpStore %70 %69 
                                Private f32* %71 = OpAccessChain %32 %44 
                                         f32 %72 = OpLoad %71 
                                Private f32* %73 = OpAccessChain %32 %44 
                                         f32 %74 = OpLoad %73 
                                         f32 %75 = OpFMul %72 %74 
                                Private f32* %76 = OpAccessChain %32 %44 
                                                     OpStore %76 %75 
                                Private f32* %78 = OpAccessChain %32 %44 
                                         f32 %79 = OpLoad %78 
                                         f32 %81 = OpFMul %79 %80 
                                                     OpStore %77 %81 
                                Private f32* %86 = OpAccessChain %32 %44 
                                         f32 %87 = OpLoad %86 
                                        bool %88 = OpFOrdGreaterThanEqual %85 %87 
                                                     OpStore %84 %88 
                                         f32 %90 = OpLoad %77 
                                         f32 %91 = OpExtInst %1 13 %90 
                                Private f32* %92 = OpAccessChain %89 %44 
                                                     OpStore %92 %91 
                                Private f32* %93 = OpAccessChain %89 %44 
                                         f32 %94 = OpLoad %93 
                                         f32 %95 = OpLoad %77 
                                         f32 %96 = OpFDiv %94 %95 
                                                     OpStore %77 %96 
                                        bool %97 = OpLoad %84 
                                                     OpSelectionMerge %101 None 
                                                     OpBranchConditional %97 %100 %103 
                                            %100 = OpLabel 
                                                     OpStore %99 %102 
                                                     OpBranch %101 
                                            %103 = OpLabel 
                                        f32 %104 = OpLoad %77 
                                        f32 %105 = OpExtInst %1 4 %104 
                                                     OpStore %99 %105 
                                                     OpBranch %101 
                                            %101 = OpLabel 
                                        f32 %106 = OpLoad %99 
                               Private f32* %107 = OpAccessChain %32 %44 
                                                     OpStore %107 %106 
                                      f32_3 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                      f32_2 %110 = OpFNegate %109 
                                      f32_2 %113 = OpFAdd %110 %112 
                                                     OpStore %89 %113 
                                      f32_2 %114 = OpLoad %89 
                                      f32_2 %115 = OpLoad %89 
                                        f32 %116 = OpDot %114 %115 
                                                     OpStore %77 %116 
                                        f32 %117 = OpLoad %77 
                                        f32 %118 = OpExtInst %1 31 %117 
                                                     OpStore %77 %118 
                                        f32 %119 = OpLoad %77 
                               Uniform f32* %121 = OpAccessChain %17 %120 
                                        f32 %122 = OpLoad %121 
                                        f32 %123 = OpFNegate %122 
                                        f32 %124 = OpFAdd %119 %123 
                                                     OpStore %77 %124 
                               Uniform f32* %125 = OpAccessChain %17 %120 
                                        f32 %126 = OpLoad %125 
                                        f32 %128 = OpFAdd %126 %127 
                               Private f32* %129 = OpAccessChain %89 %44 
                                                     OpStore %129 %128 
                               Private f32* %130 = OpAccessChain %89 %44 
                                        f32 %131 = OpLoad %130 
                               Uniform f32* %133 = OpAccessChain %17 %132 
                                        f32 %134 = OpLoad %133 
                                        f32 %135 = OpFNegate %134 
                                        f32 %136 = OpFAdd %131 %135 
                               Private f32* %137 = OpAccessChain %89 %44 
                                                     OpStore %137 %136 
                               Private f32* %138 = OpAccessChain %89 %44 
                                        f32 %139 = OpLoad %138 
                               Uniform f32* %140 = OpAccessChain %17 %120 
                                        f32 %141 = OpLoad %140 
                                        f32 %142 = OpFNegate %141 
                                        f32 %143 = OpFAdd %139 %142 
                               Private f32* %144 = OpAccessChain %89 %44 
                                                     OpStore %144 %143 
                               Private f32* %145 = OpAccessChain %89 %44 
                                        f32 %146 = OpLoad %145 
                                        f32 %147 = OpFDiv %102 %146 
                               Private f32* %148 = OpAccessChain %89 %44 
                                                     OpStore %148 %147 
                                        f32 %149 = OpLoad %77 
                               Private f32* %150 = OpAccessChain %89 %44 
                                        f32 %151 = OpLoad %150 
                                        f32 %152 = OpFMul %149 %151 
                                                     OpStore %77 %152 
                                        f32 %153 = OpLoad %77 
                                        f32 %155 = OpExtInst %1 43 %153 %154 %102 
                                                     OpStore %77 %155 
                                        f32 %156 = OpLoad %77 
                                        f32 %158 = OpFMul %156 %157 
                                        f32 %160 = OpFAdd %158 %159 
                               Private f32* %161 = OpAccessChain %89 %44 
                                                     OpStore %161 %160 
                                        f32 %162 = OpLoad %77 
                                        f32 %163 = OpLoad %77 
                                        f32 %164 = OpFMul %162 %163 
                                                     OpStore %77 %164 
                               Private f32* %165 = OpAccessChain %89 %44 
                                        f32 %166 = OpLoad %165 
                                        f32 %167 = OpFNegate %166 
                                        f32 %168 = OpLoad %77 
                                        f32 %169 = OpFMul %167 %168 
                                        f32 %170 = OpFAdd %169 %102 
                                                     OpStore %77 %170 
                               Private f32* %171 = OpAccessChain %32 %44 
                                        f32 %172 = OpLoad %171 
                                        f32 %173 = OpLoad %77 
                                        f32 %174 = OpFMul %172 %173 
                               Private f32* %175 = OpAccessChain %32 %44 
                                                     OpStore %175 %174 
                                      f32_2 %176 = OpLoad %32 
                                      f32_2 %177 = OpVectorShuffle %176 %176 0 0 
                                      f32_2 %178 = OpFNegate %177 
                               Uniform f32* %180 = OpAccessChain %17 %179 
                                        f32 %181 = OpLoad %180 
                               Uniform f32* %182 = OpAccessChain %17 %179 
                                        f32 %183 = OpLoad %182 
                                      f32_2 %184 = OpCompositeConstruct %181 %183 
                                        f32 %185 = OpCompositeExtract %184 0 
                                        f32 %186 = OpCompositeExtract %184 1 
                                      f32_2 %187 = OpCompositeConstruct %185 %186 
                                      f32_2 %188 = OpFMul %178 %187 
                                      f32_3 %189 = OpLoad %9 
                                      f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                      f32_2 %191 = OpFAdd %188 %190 
                                      f32_3 %192 = OpLoad %9 
                                      f32_3 %193 = OpVectorShuffle %192 %191 3 4 2 
                                                     OpStore %9 %193 
                        read_only Texture2D %197 = OpLoad %196 
                                    sampler %201 = OpLoad %200 
                 read_only Texture2DSampled %203 = OpSampledImage %197 %201 
                                      f32_3 %204 = OpLoad %9 
                                      f32_2 %205 = OpVectorShuffle %204 %204 0 1 
                                      f32_4 %206 = OpImageSampleImplicitLod %203 %205 
                                      f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                                     OpStore %9 %207 
                                      f32_3 %210 = OpLoad %9 
                                      f32_4 %211 = OpLoad %209 
                                      f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                     OpStore %209 %212 
                                Output f32* %215 = OpAccessChain %209 %213 
                                                     OpStore %215 %102 
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