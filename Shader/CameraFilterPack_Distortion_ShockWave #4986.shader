//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Distortion_ShockWave" {
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
  GpuProgramID 27936
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
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bool u_xlatb5;
vec2 u_xlat6;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy + (-vec2(_Value, _Value2));
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat13 = inversesqrt(u_xlat9);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat1.xy = vec2(u_xlat13) * u_xlat1.xy;
    u_xlat13 = _Value3 * _TimeX;
    u_xlat13 = floor(u_xlat13);
    u_xlat13 = _TimeX * _Value3 + (-u_xlat13);
    u_xlat2.x = (-u_xlat13) + u_xlat9;
    u_xlat6.x = u_xlat2.x * 10.0;
    u_xlat6.x = log2(abs(u_xlat6.x));
    u_xlat6.x = u_xlat6.x * 0.800000012;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat3.z = (-u_xlat6.x) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat3.z;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xx;
    u_xlat2.x = u_xlat9 * u_xlat13;
    u_xlat6.xy = vec2(u_xlat13) + vec2(0.100000001, -0.100000001);
    u_xlat13 = u_xlat2.x * 40.0;
    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat13);
    u_xlat3.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat3.w = 1.0;
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(0.0);
    u_xlatb1 = u_xlat6.x>=u_xlat9;
    u_xlatb5 = u_xlat9>=u_xlat6.y;
    u_xlatb1 = u_xlatb5 && u_xlatb1;
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat3 : u_xlat0;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat0.zzzz * u_xlat2;
    u_xlat1 = u_xlat3 / vec4(u_xlat13);
    SV_Target0 = u_xlat1 * u_xlat0.wwww + u_xlat2;
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
; Bound: 216
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %208 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpMemberDecorate %14 3 Offset 14 
                                                     OpMemberDecorate %14 4 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %188 DescriptorSet 188 
                                                     OpDecorate %188 Binding 188 
                                                     OpDecorate %192 DescriptorSet 192 
                                                     OpDecorate %192 Binding 192 
                                                     OpDecorate %208 Location 208 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %14 = OpTypeStruct %6 %6 %6 %6 %7 
                                             %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 4 
                                             %19 = OpTypePointer Uniform %7 
                              Private f32_4* %30 = OpVariable Private 
                                         i32 %33 = OpConstant 1 
                                             %34 = OpTypePointer Uniform %6 
                                         i32 %37 = OpConstant 2 
                                             %45 = OpTypePointer Private %6 
                                Private f32* %46 = OpVariable Private 
                                Private f32* %52 = OpVariable Private 
                                         i32 %64 = OpConstant 3 
                                         i32 %67 = OpConstant 0 
                              Private f32_4* %81 = OpVariable Private 
                                             %86 = OpTypeInt 32 0 
                                         u32 %87 = OpConstant 0 
                                             %89 = OpTypePointer Private %10 
                              Private f32_2* %90 = OpVariable Private 
                                         f32 %93 = OpConstant 3.674022E-40 
                                        f32 %103 = OpConstant 3.674022E-40 
                             Private f32_4* %110 = OpVariable Private 
                                        f32 %114 = OpConstant 3.674022E-40 
                                        u32 %116 = OpConstant 2 
                                        f32 %137 = OpConstant 3.674022E-40 
                                        f32 %138 = OpConstant 3.674022E-40 
                                      f32_2 %139 = OpConstantComposite %137 %138 
                                        f32 %143 = OpConstant 3.674022E-40 
                                        u32 %159 = OpConstant 3 
                                        f32 %162 = OpConstant 3.674022E-40 
                                            %164 = OpTypeBool 
                                            %165 = OpTypePointer Private %164 
                              Private bool* %166 = OpVariable Private 
                              Private bool* %171 = OpVariable Private 
                                        u32 %173 = OpConstant 1 
                                            %183 = OpTypeVector %164 4 
                                            %186 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %187 = OpTypePointer UniformConstant %186 
       UniformConstant read_only Texture2D* %188 = OpVariable UniformConstant 
                                            %190 = OpTypeSampler 
                                            %191 = OpTypePointer UniformConstant %190 
                   UniformConstant sampler* %192 = OpVariable UniformConstant 
                                            %194 = OpTypeSampledImage %186 
                                            %207 = OpTypePointer Output %7 
                              Output f32_4* %208 = OpVariable Output 
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
                                       f32_4 %31 = OpLoad %9 
                                       f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                Uniform f32* %35 = OpAccessChain %16 %33 
                                         f32 %36 = OpLoad %35 
                                Uniform f32* %38 = OpAccessChain %16 %37 
                                         f32 %39 = OpLoad %38 
                                       f32_2 %40 = OpCompositeConstruct %36 %39 
                                       f32_2 %41 = OpFNegate %40 
                                       f32_2 %42 = OpFAdd %32 %41 
                                       f32_4 %43 = OpLoad %30 
                                       f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                                     OpStore %30 %44 
                                       f32_4 %47 = OpLoad %30 
                                       f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                       f32_4 %49 = OpLoad %30 
                                       f32_2 %50 = OpVectorShuffle %49 %49 0 1 
                                         f32 %51 = OpDot %48 %50 
                                                     OpStore %46 %51 
                                         f32 %53 = OpLoad %46 
                                         f32 %54 = OpExtInst %1 32 %53 
                                                     OpStore %52 %54 
                                         f32 %55 = OpLoad %46 
                                         f32 %56 = OpExtInst %1 31 %55 
                                                     OpStore %46 %56 
                                         f32 %57 = OpLoad %52 
                                       f32_2 %58 = OpCompositeConstruct %57 %57 
                                       f32_4 %59 = OpLoad %30 
                                       f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                       f32_2 %61 = OpFMul %58 %60 
                                       f32_4 %62 = OpLoad %30 
                                       f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                     OpStore %30 %63 
                                Uniform f32* %65 = OpAccessChain %16 %64 
                                         f32 %66 = OpLoad %65 
                                Uniform f32* %68 = OpAccessChain %16 %67 
                                         f32 %69 = OpLoad %68 
                                         f32 %70 = OpFMul %66 %69 
                                                     OpStore %52 %70 
                                         f32 %71 = OpLoad %52 
                                         f32 %72 = OpExtInst %1 8 %71 
                                                     OpStore %52 %72 
                                Uniform f32* %73 = OpAccessChain %16 %67 
                                         f32 %74 = OpLoad %73 
                                Uniform f32* %75 = OpAccessChain %16 %64 
                                         f32 %76 = OpLoad %75 
                                         f32 %77 = OpFMul %74 %76 
                                         f32 %78 = OpLoad %52 
                                         f32 %79 = OpFNegate %78 
                                         f32 %80 = OpFAdd %77 %79 
                                                     OpStore %52 %80 
                                         f32 %82 = OpLoad %52 
                                         f32 %83 = OpFNegate %82 
                                         f32 %84 = OpLoad %46 
                                         f32 %85 = OpFAdd %83 %84 
                                Private f32* %88 = OpAccessChain %81 %87 
                                                     OpStore %88 %85 
                                Private f32* %91 = OpAccessChain %81 %87 
                                         f32 %92 = OpLoad %91 
                                         f32 %94 = OpFMul %92 %93 
                                Private f32* %95 = OpAccessChain %90 %87 
                                                     OpStore %95 %94 
                                Private f32* %96 = OpAccessChain %90 %87 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpExtInst %1 4 %97 
                                         f32 %99 = OpExtInst %1 30 %98 
                               Private f32* %100 = OpAccessChain %90 %87 
                                                     OpStore %100 %99 
                               Private f32* %101 = OpAccessChain %90 %87 
                                        f32 %102 = OpLoad %101 
                                        f32 %104 = OpFMul %102 %103 
                               Private f32* %105 = OpAccessChain %90 %87 
                                                     OpStore %105 %104 
                               Private f32* %106 = OpAccessChain %90 %87 
                                        f32 %107 = OpLoad %106 
                                        f32 %108 = OpExtInst %1 29 %107 
                               Private f32* %109 = OpAccessChain %90 %87 
                                                     OpStore %109 %108 
                               Private f32* %111 = OpAccessChain %90 %87 
                                        f32 %112 = OpLoad %111 
                                        f32 %113 = OpFNegate %112 
                                        f32 %115 = OpFAdd %113 %114 
                               Private f32* %117 = OpAccessChain %110 %116 
                                                     OpStore %117 %115 
                               Private f32* %118 = OpAccessChain %81 %87 
                                        f32 %119 = OpLoad %118 
                               Private f32* %120 = OpAccessChain %110 %116 
                                        f32 %121 = OpLoad %120 
                                        f32 %122 = OpFMul %119 %121 
                               Private f32* %123 = OpAccessChain %81 %87 
                                                     OpStore %123 %122 
                                      f32_4 %124 = OpLoad %30 
                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                      f32_4 %126 = OpLoad %81 
                                      f32_2 %127 = OpVectorShuffle %126 %126 0 0 
                                      f32_2 %128 = OpFMul %125 %127 
                                      f32_4 %129 = OpLoad %30 
                                      f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
                                                     OpStore %30 %130 
                                        f32 %131 = OpLoad %46 
                                        f32 %132 = OpLoad %52 
                                        f32 %133 = OpFMul %131 %132 
                               Private f32* %134 = OpAccessChain %81 %87 
                                                     OpStore %134 %133 
                                        f32 %135 = OpLoad %52 
                                      f32_2 %136 = OpCompositeConstruct %135 %135 
                                      f32_2 %140 = OpFAdd %136 %139 
                                                     OpStore %90 %140 
                               Private f32* %141 = OpAccessChain %81 %87 
                                        f32 %142 = OpLoad %141 
                                        f32 %144 = OpFMul %142 %143 
                                                     OpStore %52 %144 
                                      f32_4 %145 = OpLoad %30 
                                      f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                        f32 %147 = OpLoad %52 
                                      f32_2 %148 = OpCompositeConstruct %147 %147 
                                      f32_2 %149 = OpFDiv %146 %148 
                                      f32_4 %150 = OpLoad %30 
                                      f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                     OpStore %30 %151 
                                      f32_4 %152 = OpLoad %9 
                                      f32_2 %153 = OpVectorShuffle %152 %152 0 1 
                                      f32_4 %154 = OpLoad %30 
                                      f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                                      f32_2 %156 = OpFAdd %153 %155 
                                      f32_4 %157 = OpLoad %110 
                                      f32_4 %158 = OpVectorShuffle %157 %156 4 5 2 3 
                                                     OpStore %110 %158 
                               Private f32* %160 = OpAccessChain %110 %159 
                                                     OpStore %160 %114 
                               Private f32* %161 = OpAccessChain %9 %116 
                                                     OpStore %161 %114 
                               Private f32* %163 = OpAccessChain %9 %159 
                                                     OpStore %163 %162 
                               Private f32* %167 = OpAccessChain %90 %87 
                                        f32 %168 = OpLoad %167 
                                        f32 %169 = OpLoad %46 
                                       bool %170 = OpFOrdGreaterThanEqual %168 %169 
                                                     OpStore %166 %170 
                                        f32 %172 = OpLoad %46 
                               Private f32* %174 = OpAccessChain %90 %173 
                                        f32 %175 = OpLoad %174 
                                       bool %176 = OpFOrdGreaterThanEqual %172 %175 
                                                     OpStore %171 %176 
                                       bool %177 = OpLoad %171 
                                       bool %178 = OpLoad %166 
                                       bool %179 = OpLogicalAnd %177 %178 
                                                     OpStore %166 %179 
                                       bool %180 = OpLoad %166 
                                      f32_4 %181 = OpLoad %110 
                                      f32_4 %182 = OpLoad %9 
                                     bool_4 %184 = OpCompositeConstruct %180 %180 %180 %180 
                                      f32_4 %185 = OpSelect %184 %181 %182 
                                                     OpStore %9 %185 
                        read_only Texture2D %189 = OpLoad %188 
                                    sampler %193 = OpLoad %192 
                 read_only Texture2DSampled %195 = OpSampledImage %189 %193 
                                      f32_4 %196 = OpLoad %9 
                                      f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                      f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                     OpStore %81 %198 
                                      f32_4 %199 = OpLoad %9 
                                      f32_4 %200 = OpVectorShuffle %199 %199 2 2 2 2 
                                      f32_4 %201 = OpLoad %81 
                                      f32_4 %202 = OpFMul %200 %201 
                                                     OpStore %110 %202 
                                      f32_4 %203 = OpLoad %110 
                                        f32 %204 = OpLoad %52 
                                      f32_4 %205 = OpCompositeConstruct %204 %204 %204 %204 
                                      f32_4 %206 = OpFDiv %203 %205 
                                                     OpStore %30 %206 
                                      f32_4 %209 = OpLoad %30 
                                      f32_4 %210 = OpLoad %9 
                                      f32_4 %211 = OpVectorShuffle %210 %210 3 3 3 3 
                                      f32_4 %212 = OpFMul %209 %211 
                                      f32_4 %213 = OpLoad %81 
                                      f32_4 %214 = OpFAdd %212 %213 
                                                     OpStore %208 %214 
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