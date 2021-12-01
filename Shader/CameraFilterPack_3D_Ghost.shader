//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/3D_Ghost" {
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
  GpuProgramID 11469
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
out vec4 vs_TEXCOORD1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Visualize;
uniform 	float _Value2;
uniform 	float GhostPosX;
uniform 	float GhostPosY;
uniform 	float GhostFade;
uniform 	float GhostFade2;
uniform 	float GhostSize;
uniform 	float Drop_Near;
uniform 	float Drop_Far;
uniform 	float Drop_With_Obj;
uniform 	float _FixDistance;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat5 = _FixDistance * 10.0;
    u_xlat0.x = u_xlat0.x / u_xlat5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = (-Drop_Near) + Drop_Far;
    u_xlat0.x = u_xlat0.x + (-Drop_Near);
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat0.x = u_xlat5 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat5);
    u_xlatb1 = _Visualize==1.0;
    if(u_xlatb1){
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
    u_xlat10 = (-GhostSize) + 1.0;
    u_xlat2.x = u_xlat10 * 0.5 + GhostPosX;
    u_xlat2.y = u_xlat10 * 0.5 + GhostPosY;
    u_xlat0.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat3 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat1 + u_xlat3;
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
    u_xlat4 = texture(_MainTex, u_xlat0.xy);
    u_xlat3 = u_xlat3 + u_xlat4;
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat2 = u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 / vec4(vec4(GhostFade2, GhostFade2, GhostFade2, GhostFade2));
    u_xlat2 = u_xlat2 + (-vec4(vec4(GhostFade, GhostFade, GhostFade, GhostFade)));
    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
    u_xlat0.x = u_xlat0.w * Drop_With_Obj;
    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 127
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %109 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate vs_TEXCOORD0 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate %89 Location 89 
                                                     OpDecorate %90 Location 90 
                                                     OpDecorate vs_TEXCOORD1 Location 109 
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
                                             %24 = OpTypeStruct %13 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %13 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %13 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %13 
                               Output f32_4* %89 = OpVariable Output 
                                Input f32_4* %90 = OpVariable Input 
                                             %92 = OpTypePointer Private %6 
                                         u32 %95 = OpConstant 0 
                                             %96 = OpTypePointer Uniform %6 
                                            %101 = OpTypeVector %6 3 
                                        f32 %104 = OpConstant 3.674022E-40 
                                      f32_3 %105 = OpConstantComposite %104 %104 %104 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                            %121 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                                                     OpStore vs_TEXCOORD0 %12 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
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
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                       f32_4 %91 = OpLoad %90 
                                                     OpStore %89 %91 
                                Private f32* %93 = OpAccessChain %15 %81 
                                         f32 %94 = OpLoad %93 
                                Uniform f32* %97 = OpAccessChain %26 %33 %95 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFMul %94 %98 
                               Private f32* %100 = OpAccessChain %15 %81 
                                                     OpStore %100 %99 
                                      f32_4 %102 = OpLoad %15 
                                      f32_3 %103 = OpVectorShuffle %102 %102 0 3 1 
                                      f32_3 %106 = OpFMul %103 %105 
                                      f32_4 %107 = OpLoad %54 
                                      f32_4 %108 = OpVectorShuffle %107 %106 4 1 5 6 
                                                     OpStore %54 %108 
                                      f32_4 %110 = OpLoad %15 
                                      f32_2 %111 = OpVectorShuffle %110 %110 2 3 
                                      f32_4 %112 = OpLoad vs_TEXCOORD1 
                                      f32_4 %113 = OpVectorShuffle %112 %111 0 1 4 5 
                                                     OpStore vs_TEXCOORD1 %113 
                                      f32_4 %114 = OpLoad %54 
                                      f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                      f32_4 %116 = OpLoad %54 
                                      f32_2 %117 = OpVectorShuffle %116 %116 0 3 
                                      f32_2 %118 = OpFAdd %115 %117 
                                      f32_4 %119 = OpLoad vs_TEXCOORD1 
                                      f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                     OpStore vs_TEXCOORD1 %120 
                                Output f32* %122 = OpAccessChain %85 %33 %81 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpFNegate %123 
                                Output f32* %125 = OpAccessChain %85 %33 %81 
                                                     OpStore %125 %124 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 368
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %130 %134 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD1 Location 11 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpMemberDecorate %38 9 Offset 38 
                                                      OpMemberDecorate %38 10 Offset 38 
                                                      OpMemberDecorate %38 11 Offset 38 
                                                      OpMemberDecorate %38 12 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate vs_TEXCOORD0 Location 134 
                                                      OpDecorate %149 DescriptorSet 149 
                                                      OpDecorate %149 Binding 149 
                                                      OpDecorate %151 DescriptorSet 151 
                                                      OpDecorate %151 Binding 151 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %21 = OpTypePointer UniformConstant %20 
         UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                              %24 = OpTypeSampler 
                                              %25 = OpTypePointer UniformConstant %24 
                     UniformConstant sampler* %26 = OpVariable UniformConstant 
                                              %28 = OpTypeSampledImage %20 
                                              %33 = OpTypeInt 32 0 
                                          u32 %34 = OpConstant 0 
                                              %36 = OpTypePointer Private %6 
                                              %38 = OpTypeStruct %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 0 
                                          u32 %43 = OpConstant 2 
                                              %44 = OpTypePointer Uniform %6 
                                          u32 %50 = OpConstant 3 
                                          f32 %55 = OpConstant 3.674022E-40 
                                 Private f32* %60 = OpVariable Private 
                                          i32 %61 = OpConstant 11 
                                          f32 %64 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          i32 %76 = OpConstant 8 
                                          i32 %80 = OpConstant 9 
                                         f32 %104 = OpConstant 3.674022E-40 
                                         f32 %106 = OpConstant 3.674022E-40 
                                             %119 = OpTypeBool 
                                             %120 = OpTypePointer Private %119 
                               Private bool* %121 = OpVariable Private 
                                         i32 %122 = OpConstant 1 
                                             %129 = OpTypePointer Output %7 
                               Output f32_4* %130 = OpVariable Output 
                                             %133 = OpTypePointer Input %12 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %136 = OpConstant 12 
                                             %137 = OpTypePointer Uniform %7 
                              Private f32_4* %148 = OpVariable Private 
        UniformConstant read_only Texture2D* %149 = OpVariable UniformConstant 
                    UniformConstant sampler* %151 = OpVariable UniformConstant 
                                         i32 %159 = OpConstant 7 
                                Private f32* %171 = OpVariable Private 
                              Private f32_4* %176 = OpVariable Private 
                                         f32 %178 = OpConstant 3.674022E-40 
                                         i32 %180 = OpConstant 3 
                                         i32 %187 = OpConstant 4 
                                         u32 %191 = OpConstant 1 
                              Private f32_4* %201 = OpVariable Private 
                              Private f32_4* %232 = OpVariable Private 
                                         i32 %303 = OpConstant 6 
                                         i32 %320 = OpConstant 5 
                                         i32 %338 = OpConstant 2 
                                         i32 %356 = OpConstant 10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                        f32_2 %17 = OpFDiv %14 %16 
                                        f32_4 %18 = OpLoad %9 
                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                                      OpStore %9 %19 
                          read_only Texture2D %23 = OpLoad %22 
                                      sampler %27 = OpLoad %26 
                   read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                                        f32_4 %30 = OpLoad %9 
                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                        f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                          f32 %35 = OpCompositeExtract %32 0 
                                 Private f32* %37 = OpAccessChain %9 %34 
                                                      OpStore %37 %35 
                                 Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %34 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpFMul %46 %48 
                                 Uniform f32* %51 = OpAccessChain %40 %42 %50 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %49 %52 
                                 Private f32* %54 = OpAccessChain %9 %34 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %9 %34 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFDiv %55 %57 
                                 Private f32* %59 = OpAccessChain %9 %34 
                                                      OpStore %59 %58 
                                 Uniform f32* %62 = OpAccessChain %40 %61 
                                          f32 %63 = OpLoad %62 
                                          f32 %65 = OpFMul %63 %64 
                                                      OpStore %60 %65 
                                 Private f32* %66 = OpAccessChain %9 %34 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpLoad %60 
                                          f32 %69 = OpFDiv %67 %68 
                                 Private f32* %70 = OpAccessChain %9 %34 
                                                      OpStore %70 %69 
                                 Private f32* %71 = OpAccessChain %9 %34 
                                          f32 %72 = OpLoad %71 
                                          f32 %74 = OpExtInst %1 43 %72 %73 %55 
                                 Private f32* %75 = OpAccessChain %9 %34 
                                                      OpStore %75 %74 
                                 Uniform f32* %77 = OpAccessChain %40 %76 
                                          f32 %78 = OpLoad %77 
                                          f32 %79 = OpFNegate %78 
                                 Uniform f32* %81 = OpAccessChain %40 %80 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %79 %82 
                                                      OpStore %60 %83 
                                 Private f32* %84 = OpAccessChain %9 %34 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %86 = OpAccessChain %40 %76 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFNegate %87 
                                          f32 %89 = OpFAdd %85 %88 
                                 Private f32* %90 = OpAccessChain %9 %34 
                                                      OpStore %90 %89 
                                          f32 %91 = OpLoad %60 
                                          f32 %92 = OpFDiv %55 %91 
                                                      OpStore %60 %92 
                                          f32 %93 = OpLoad %60 
                                 Private f32* %94 = OpAccessChain %9 %34 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFMul %93 %95 
                                 Private f32* %97 = OpAccessChain %9 %34 
                                                      OpStore %97 %96 
                                 Private f32* %98 = OpAccessChain %9 %34 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpExtInst %1 43 %99 %73 %55 
                                Private f32* %101 = OpAccessChain %9 %34 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %9 %34 
                                         f32 %103 = OpLoad %102 
                                         f32 %105 = OpFMul %103 %104 
                                         f32 %107 = OpFAdd %105 %106 
                                                      OpStore %60 %107 
                                Private f32* %108 = OpAccessChain %9 %34 
                                         f32 %109 = OpLoad %108 
                                Private f32* %110 = OpAccessChain %9 %34 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFMul %109 %111 
                                Private f32* %113 = OpAccessChain %9 %34 
                                                      OpStore %113 %112 
                                       f32_4 %114 = OpLoad %9 
                                       f32_4 %115 = OpVectorShuffle %114 %114 0 0 0 0 
                                         f32 %116 = OpLoad %60 
                                       f32_4 %117 = OpCompositeConstruct %116 %116 %116 %116 
                                       f32_4 %118 = OpFMul %115 %117 
                                                      OpStore %9 %118 
                                Uniform f32* %123 = OpAccessChain %40 %122 
                                         f32 %124 = OpLoad %123 
                                        bool %125 = OpFOrdEqual %124 %55 
                                                      OpStore %121 %125 
                                        bool %126 = OpLoad %121 
                                                      OpSelectionMerge %128 None 
                                                      OpBranchConditional %126 %127 %128 
                                             %127 = OpLabel 
                                       f32_4 %131 = OpLoad %9 
                                                      OpStore %130 %131 
                                                      OpReturn
                                             %128 = OpLabel 
                                       f32_2 %135 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %138 = OpAccessChain %40 %136 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %135 %140 
                              Uniform f32_4* %142 = OpAccessChain %40 %136 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
                                       f32_2 %145 = OpFAdd %141 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                         read_only Texture2D %150 = OpLoad %149 
                                     sampler %152 = OpLoad %151 
                  read_only Texture2DSampled %153 = OpSampledImage %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                                       f32_4 %156 = OpImageSampleImplicitLod %153 %155 
                                                      OpStore %148 %156 
                                       f32_4 %157 = OpLoad %9 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                Uniform f32* %160 = OpAccessChain %40 %159 
                                         f32 %161 = OpLoad %160 
                                Uniform f32* %162 = OpAccessChain %40 %159 
                                         f32 %163 = OpLoad %162 
                                       f32_2 %164 = OpCompositeConstruct %161 %163 
                                         f32 %165 = OpCompositeExtract %164 0 
                                         f32 %166 = OpCompositeExtract %164 1 
                                       f32_2 %167 = OpCompositeConstruct %165 %166 
                                       f32_2 %168 = OpFDiv %158 %167 
                                       f32_4 %169 = OpLoad %9 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %9 %170 
                                Uniform f32* %172 = OpAccessChain %40 %159 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpFAdd %174 %55 
                                                      OpStore %171 %175 
                                         f32 %177 = OpLoad %171 
                                         f32 %179 = OpFMul %177 %178 
                                Uniform f32* %181 = OpAccessChain %40 %180 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFAdd %179 %182 
                                Private f32* %184 = OpAccessChain %176 %34 
                                                      OpStore %184 %183 
                                         f32 %185 = OpLoad %171 
                                         f32 %186 = OpFMul %185 %178 
                                Uniform f32* %188 = OpAccessChain %40 %187 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFAdd %186 %189 
                                Private f32* %192 = OpAccessChain %176 %191 
                                                      OpStore %192 %190 
                                       f32_4 %193 = OpLoad %9 
                                       f32_2 %194 = OpVectorShuffle %193 %193 0 1 
                                       f32_4 %195 = OpLoad %176 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_2 %197 = OpFNegate %196 
                                       f32_2 %198 = OpFAdd %194 %197 
                                       f32_4 %199 = OpLoad %9 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
                                                      OpStore %9 %200 
                         read_only Texture2D %202 = OpLoad %149 
                                     sampler %203 = OpLoad %151 
                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
                                       f32_4 %205 = OpLoad %9 
                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
                                       f32_4 %207 = OpImageSampleImplicitLod %204 %206 
                                                      OpStore %201 %207 
                                       f32_4 %208 = OpLoad %148 
                                       f32_4 %209 = OpLoad %201 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %201 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                Uniform f32* %213 = OpAccessChain %40 %159 
                                         f32 %214 = OpLoad %213 
                                Uniform f32* %215 = OpAccessChain %40 %159 
                                         f32 %216 = OpLoad %215 
                                       f32_2 %217 = OpCompositeConstruct %214 %216 
                                         f32 %218 = OpCompositeExtract %217 0 
                                         f32 %219 = OpCompositeExtract %217 1 
                                       f32_2 %220 = OpCompositeConstruct %218 %219 
                                       f32_2 %221 = OpFDiv %212 %220 
                                       f32_4 %222 = OpLoad %9 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 2 3 
                                                      OpStore %9 %223 
                                       f32_4 %224 = OpLoad %176 
                                       f32_2 %225 = OpVectorShuffle %224 %224 0 1 
                                       f32_2 %226 = OpFNegate %225 
                                       f32_4 %227 = OpLoad %9 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                                       f32_2 %229 = OpFAdd %226 %228 
                                       f32_4 %230 = OpLoad %9 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 2 3 
                                                      OpStore %9 %231 
                         read_only Texture2D %233 = OpLoad %149 
                                     sampler %234 = OpLoad %151 
                  read_only Texture2DSampled %235 = OpSampledImage %233 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                       f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                                      OpStore %232 %238 
                                       f32_4 %239 = OpLoad %201 
                                       f32_4 %240 = OpLoad %232 
                                       f32_4 %241 = OpFAdd %239 %240 
                                                      OpStore %201 %241 
                                       f32_4 %242 = OpLoad %9 
                                       f32_2 %243 = OpVectorShuffle %242 %242 0 1 
                                Uniform f32* %244 = OpAccessChain %40 %159 
                                         f32 %245 = OpLoad %244 
                                Uniform f32* %246 = OpAccessChain %40 %159 
                                         f32 %247 = OpLoad %246 
                                       f32_2 %248 = OpCompositeConstruct %245 %247 
                                         f32 %249 = OpCompositeExtract %248 0 
                                         f32 %250 = OpCompositeExtract %248 1 
                                       f32_2 %251 = OpCompositeConstruct %249 %250 
                                       f32_2 %252 = OpFDiv %243 %251 
                                       f32_4 %253 = OpLoad %9 
                                       f32_4 %254 = OpVectorShuffle %253 %252 4 5 2 3 
                                                      OpStore %9 %254 
                                       f32_4 %255 = OpLoad %176 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFNegate %256 
                                       f32_4 %258 = OpLoad %9 
                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
                                       f32_2 %260 = OpFAdd %257 %259 
                                       f32_4 %261 = OpLoad %9 
                                       f32_4 %262 = OpVectorShuffle %261 %260 4 5 2 3 
                                                      OpStore %9 %262 
                         read_only Texture2D %263 = OpLoad %149 
                                     sampler %264 = OpLoad %151 
                  read_only Texture2DSampled %265 = OpSampledImage %263 %264 
                                       f32_4 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 1 
                                       f32_4 %268 = OpImageSampleImplicitLod %265 %267 
                                                      OpStore %232 %268 
                                       f32_4 %269 = OpLoad %201 
                                       f32_4 %270 = OpLoad %232 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %201 %271 
                                       f32_4 %272 = OpLoad %9 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                                Uniform f32* %274 = OpAccessChain %40 %159 
                                         f32 %275 = OpLoad %274 
                                Uniform f32* %276 = OpAccessChain %40 %159 
                                         f32 %277 = OpLoad %276 
                                       f32_2 %278 = OpCompositeConstruct %275 %277 
                                         f32 %279 = OpCompositeExtract %278 0 
                                         f32 %280 = OpCompositeExtract %278 1 
                                       f32_2 %281 = OpCompositeConstruct %279 %280 
                                       f32_2 %282 = OpFDiv %273 %281 
                                       f32_4 %283 = OpLoad %9 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 2 3 
                                                      OpStore %9 %284 
                                       f32_4 %285 = OpLoad %176 
                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
                                       f32_2 %287 = OpFNegate %286 
                                       f32_4 %288 = OpLoad %9 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 1 
                                       f32_2 %290 = OpFAdd %287 %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 2 3 
                                                      OpStore %9 %292 
                         read_only Texture2D %293 = OpLoad %149 
                                     sampler %294 = OpLoad %151 
                  read_only Texture2DSampled %295 = OpSampledImage %293 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
                                       f32_4 %298 = OpImageSampleImplicitLod %295 %297 
                                                      OpStore %176 %298 
                                       f32_4 %299 = OpLoad %176 
                                       f32_4 %300 = OpLoad %201 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %176 %301 
                                       f32_4 %302 = OpLoad %176 
                                Uniform f32* %304 = OpAccessChain %40 %303 
                                         f32 %305 = OpLoad %304 
                                Uniform f32* %306 = OpAccessChain %40 %303 
                                         f32 %307 = OpLoad %306 
                                Uniform f32* %308 = OpAccessChain %40 %303 
                                         f32 %309 = OpLoad %308 
                                Uniform f32* %310 = OpAccessChain %40 %303 
                                         f32 %311 = OpLoad %310 
                                       f32_4 %312 = OpCompositeConstruct %305 %307 %309 %311 
                                         f32 %313 = OpCompositeExtract %312 0 
                                         f32 %314 = OpCompositeExtract %312 1 
                                         f32 %315 = OpCompositeExtract %312 2 
                                         f32 %316 = OpCompositeExtract %312 3 
                                       f32_4 %317 = OpCompositeConstruct %313 %314 %315 %316 
                                       f32_4 %318 = OpFDiv %302 %317 
                                                      OpStore %176 %318 
                                       f32_4 %319 = OpLoad %176 
                                Uniform f32* %321 = OpAccessChain %40 %320 
                                         f32 %322 = OpLoad %321 
                                Uniform f32* %323 = OpAccessChain %40 %320 
                                         f32 %324 = OpLoad %323 
                                Uniform f32* %325 = OpAccessChain %40 %320 
                                         f32 %326 = OpLoad %325 
                                Uniform f32* %327 = OpAccessChain %40 %320 
                                         f32 %328 = OpLoad %327 
                                       f32_4 %329 = OpCompositeConstruct %322 %324 %326 %328 
                                         f32 %330 = OpCompositeExtract %329 0 
                                         f32 %331 = OpCompositeExtract %329 1 
                                         f32 %332 = OpCompositeExtract %329 2 
                                         f32 %333 = OpCompositeExtract %329 3 
                                       f32_4 %334 = OpCompositeConstruct %330 %331 %332 %333 
                                       f32_4 %335 = OpFNegate %334 
                                       f32_4 %336 = OpFAdd %319 %335 
                                                      OpStore %176 %336 
                                       f32_4 %337 = OpLoad %176 
                                Uniform f32* %339 = OpAccessChain %40 %338 
                                         f32 %340 = OpLoad %339 
                                Uniform f32* %341 = OpAccessChain %40 %338 
                                         f32 %342 = OpLoad %341 
                                Uniform f32* %343 = OpAccessChain %40 %338 
                                         f32 %344 = OpLoad %343 
                                Uniform f32* %345 = OpAccessChain %40 %338 
                                         f32 %346 = OpLoad %345 
                                       f32_4 %347 = OpCompositeConstruct %340 %342 %344 %346 
                                         f32 %348 = OpCompositeExtract %347 0 
                                         f32 %349 = OpCompositeExtract %347 1 
                                         f32 %350 = OpCompositeExtract %347 2 
                                         f32 %351 = OpCompositeExtract %347 3 
                                       f32_4 %352 = OpCompositeConstruct %348 %349 %350 %351 
                                       f32_4 %353 = OpFMul %337 %352 
                                                      OpStore %176 %353 
                                Private f32* %354 = OpAccessChain %9 %50 
                                         f32 %355 = OpLoad %354 
                                Uniform f32* %357 = OpAccessChain %40 %356 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFMul %355 %358 
                                Private f32* %360 = OpAccessChain %9 %34 
                                                      OpStore %360 %359 
                                       f32_4 %361 = OpLoad %9 
                                       f32_4 %362 = OpVectorShuffle %361 %361 0 0 0 0 
                                       f32_4 %363 = OpLoad %176 
                                       f32_4 %364 = OpFMul %362 %363 
                                       f32_4 %365 = OpLoad %148 
                                       f32_4 %366 = OpFAdd %364 %365 
                                                      OpStore %130 %366 
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