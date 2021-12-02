//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Glitch2" {
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
  GpuProgramID 32405
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
uniform 	float _Glitch;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec4 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
vec2 u_xlat11;
float u_xlat16;
void main()
{
    u_xlat0 = texture(_MainTex, vec2(0.5, 0.5));
    u_xlatb5 = u_xlat0.x<1.0;
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = u_xlat10.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
    u_xlat2 = texture(_MainTex, u_xlat10.xy);
    u_xlat3 = u_xlat1.zwzw * vec4(500000.0, 500000.0, 4.50000007e-05, 4.50000007e-05);
    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat3.zw : u_xlat1.zw;
    u_xlatb4 = lessThan(u_xlat0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
    u_xlat5.xy = (u_xlatb4.w) ? u_xlat3.xy : u_xlat5.xy;
    u_xlat3 = u_xlat1 * vec4(4.99999987e-05, 4.99999987e-05, 0.000449999992, 0.000449999992);
    u_xlat5.xy = (u_xlatb4.z) ? u_xlat3.zw : u_xlat5.xy;
    u_xlat5.xy = (u_xlatb4.y) ? u_xlat3.xy : u_xlat5.xy;
    u_xlat1.xy = (u_xlatb4.x) ? u_xlat1.zw : u_xlat5.xy;
    u_xlat1.z = float(0.25);
    u_xlat1.w = float(0.349999994);
    u_xlat3 = texture(_MainTex, u_xlat1.xz);
    u_xlat4 = texture(_MainTex, u_xlat1.xw);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat10.x = log2(u_xlat3.x);
    u_xlat10.x = u_xlat10.x * 6.93147182;
    u_xlat10.x = sin(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * 200.0;
    u_xlat1.yz = u_xlat10.xx * u_xlat1.xy;
    u_xlat10.x = cos(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * vec3(179.0, 2.25, 0.846800029);
    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat10.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat5.x * u_xlat0.x + u_xlat1.y;
    u_xlatb5 = u_xlat5.x<0.5;
    u_xlat1.x = (u_xlatb5) ? u_xlat0.x : u_xlat1.y;
    u_xlat0.x = sin(u_xlat3.x);
    u_xlat0.yw = cos(u_xlat3.yz);
    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
    u_xlat11.xy = fract(u_xlat1.xy);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
    u_xlat1.xy = u_xlat11.xy * u_xlat11.xy;
    u_xlat11.xy = (-u_xlat11.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat1.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat3.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.xyw = u_xlat0.xyw * vec3(43812.1758, 0.400000006, 0.800000012);
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.xyz = sin(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat11.x = (-u_xlat3.y) + u_xlat3.z;
    u_xlat11.x = u_xlat1.x * u_xlat11.x + u_xlat3.y;
    u_xlat16 = (-u_xlat0.x) + u_xlat3.x;
    u_xlat0.x = u_xlat1.x * u_xlat16 + u_xlat0.x;
    u_xlat1.x = (-u_xlat0.x) + u_xlat11.x;
    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
    u_xlat5.xz = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.yw;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 6.23799992;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43812.1758;
    u_xlat1.x = fract(u_xlat0.x);
    u_xlat0.xy = sin(u_xlat5.xz);
    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
    u_xlat1.yz = fract(u_xlat0.xy);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = vec3(vec3(_Glitch, _Glitch, _Glitch)) * u_xlat0.xyz + u_xlat2.xyz;
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
; Bound: 461
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %39 %437 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 39 
                                             OpMemberDecorate %41 0 Offset 41 
                                             OpMemberDecorate %41 1 Offset 41 
                                             OpDecorate %41 Block 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate %437 Location 437 
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
                                 f32 %21 = OpConstant 3.674022E-40 
                               f32_2 %22 = OpConstantComposite %21 %21 
                                     %24 = OpTypeInt 32 0 
                                 u32 %25 = OpConstant 0 
                                     %27 = OpTypePointer Private %6 
                                     %29 = OpTypeBool 
                                     %30 = OpTypePointer Private %29 
                       Private bool* %31 = OpVariable Private 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %36 = OpTypePointer Private %20 
                      Private f32_2* %37 = OpVariable Private 
                                     %38 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %41 = OpTypeStruct %6 %7 
                                     %42 = OpTypePointer Uniform %41 
       Uniform struct {f32; f32_4;}* %43 = OpVariable Uniform 
                                     %44 = OpTypeInt 32 1 
                                 i32 %45 = OpConstant 1 
                                     %46 = OpTypePointer Uniform %7 
                      Private f32_4* %55 = OpVariable Private 
                                 f32 %58 = OpConstant 3.674022E-40 
                                 f32 %59 = OpConstant 3.674022E-40 
                               f32_4 %60 = OpConstantComposite %58 %59 %59 %59 
                                     %62 = OpTypeVector %6 3 
                                     %63 = OpTypePointer Private %62 
                      Private f32_3* %64 = OpVariable Private 
                      Private f32_4* %71 = OpVariable Private 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_4 %76 = OpConstantComposite %74 %74 %75 %75 
                      Private f32_2* %78 = OpVariable Private 
                                     %80 = OpTypePointer Function %20 
                                     %90 = OpTypeVector %29 4 
                                     %91 = OpTypePointer Private %90 
                     Private bool_4* %92 = OpVariable Private 
                                 f32 %95 = OpConstant 3.674022E-40 
                                 f32 %96 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                                 f32 %98 = OpConstant 3.674022E-40 
                               f32_4 %99 = OpConstantComposite %95 %96 %97 %98 
                                u32 %101 = OpConstant 3 
                                f32 %113 = OpConstant 3.674022E-40 
                                f32 %114 = OpConstant 3.674022E-40 
                              f32_4 %115 = OpConstantComposite %113 %113 %114 %114 
                                u32 %117 = OpConstant 2 
                                u32 %128 = OpConstant 1 
                                f32 %151 = OpConstant 3.674022E-40 
                                f32 %153 = OpConstant 3.674022E-40 
                                f32 %177 = OpConstant 3.674022E-40 
                                f32 %184 = OpConstant 3.674022E-40 
                                f32 %200 = OpConstant 3.674022E-40 
                                f32 %201 = OpConstant 3.674022E-40 
                                f32 %202 = OpConstant 3.674022E-40 
                              f32_3 %203 = OpConstantComposite %200 %201 %202 
                                f32 %209 = OpConstant 3.674022E-40 
                      Private bool* %228 = OpVariable Private 
                                    %233 = OpTypePointer Function %6 
                     Private f32_2* %260 = OpVariable Private 
                                f32 %271 = OpConstant 3.674022E-40 
                                f32 %284 = OpConstant 3.674022E-40 
                              f32_2 %285 = OpConstantComposite %284 %284 
                                f32 %287 = OpConstant 3.674022E-40 
                              f32_2 %288 = OpConstantComposite %287 %287 
                                f32 %298 = OpConstant 3.674022E-40 
                              f32_3 %299 = OpConstantComposite %34 %271 %298 
                                f32 %309 = OpConstant 3.674022E-40 
                              f32_3 %310 = OpConstantComposite %309 %96 %98 
                              f32_3 %325 = OpConstantComposite %309 %309 %309 
                       Private f32* %350 = OpVariable Private 
                                f32 %383 = OpConstant 3.674022E-40 
                              f32_2 %384 = OpConstantComposite %383 %383 
                                f32 %397 = OpConstant 3.674022E-40 
                              f32_2 %418 = OpConstantComposite %309 %309 
                                    %436 = OpTypePointer Output %7 
                      Output f32_4* %437 = OpVariable Output 
                                i32 %438 = OpConstant 0 
                                    %439 = OpTypePointer Uniform %6 
                                    %458 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_2* %81 = OpVariable Function 
                    Function f32_2* %104 = OpVariable Function 
                    Function f32_2* %120 = OpVariable Function 
                    Function f32_2* %131 = OpVariable Function 
                    Function f32_2* %141 = OpVariable Function 
                      Function f32* %234 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpImageSampleImplicitLod %19 %22 
                                 f32 %26 = OpCompositeExtract %23 0 
                        Private f32* %28 = OpAccessChain %9 %25 
                                             OpStore %28 %26 
                        Private f32* %32 = OpAccessChain %9 %25 
                                 f32 %33 = OpLoad %32 
                                bool %35 = OpFOrdLessThan %33 %34 
                                             OpStore %31 %35 
                               f32_2 %40 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %47 = OpAccessChain %43 %45 
                               f32_4 %48 = OpLoad %47 
                               f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                               f32_2 %50 = OpFMul %40 %49 
                      Uniform f32_4* %51 = OpAccessChain %43 %45 
                               f32_4 %52 = OpLoad %51 
                               f32_2 %53 = OpVectorShuffle %52 %52 2 3 
                               f32_2 %54 = OpFAdd %50 %53 
                                             OpStore %37 %54 
                               f32_2 %56 = OpLoad %37 
                               f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                               f32_4 %61 = OpFAdd %57 %60 
                                             OpStore %55 %61 
                 read_only Texture2D %65 = OpLoad %12 
                             sampler %66 = OpLoad %16 
          read_only Texture2DSampled %67 = OpSampledImage %65 %66 
                               f32_2 %68 = OpLoad %37 
                               f32_4 %69 = OpImageSampleImplicitLod %67 %68 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                             OpStore %64 %70 
                               f32_4 %72 = OpLoad %55 
                               f32_4 %73 = OpVectorShuffle %72 %72 2 3 2 3 
                               f32_4 %77 = OpFMul %73 %76 
                                             OpStore %71 %77 
                                bool %79 = OpLoad %31 
                                             OpSelectionMerge %83 None 
                                             OpBranchConditional %79 %82 %86 
                                     %82 = OpLabel 
                               f32_4 %84 = OpLoad %71 
                               f32_2 %85 = OpVectorShuffle %84 %84 2 3 
                                             OpStore %81 %85 
                                             OpBranch %83 
                                     %86 = OpLabel 
                               f32_4 %87 = OpLoad %55 
                               f32_2 %88 = OpVectorShuffle %87 %87 2 3 
                                             OpStore %81 %88 
                                             OpBranch %83 
                                     %83 = OpLabel 
                               f32_2 %89 = OpLoad %81 
                                             OpStore %78 %89 
                               f32_4 %93 = OpLoad %9 
                               f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                             bool_4 %100 = OpFOrdLessThan %94 %99 
                                             OpStore %92 %100 
                      Private bool* %102 = OpAccessChain %92 %101 
                               bool %103 = OpLoad %102 
                                             OpSelectionMerge %106 None 
                                             OpBranchConditional %103 %105 %109 
                                    %105 = OpLabel 
                              f32_4 %107 = OpLoad %71 
                              f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                             OpStore %104 %108 
                                             OpBranch %106 
                                    %109 = OpLabel 
                              f32_2 %110 = OpLoad %78 
                                             OpStore %104 %110 
                                             OpBranch %106 
                                    %106 = OpLabel 
                              f32_2 %111 = OpLoad %104 
                                             OpStore %78 %111 
                              f32_4 %112 = OpLoad %55 
                              f32_4 %116 = OpFMul %112 %115 
                                             OpStore %71 %116 
                      Private bool* %118 = OpAccessChain %92 %117 
                               bool %119 = OpLoad %118 
                                             OpSelectionMerge %122 None 
                                             OpBranchConditional %119 %121 %125 
                                    %121 = OpLabel 
                              f32_4 %123 = OpLoad %71 
                              f32_2 %124 = OpVectorShuffle %123 %123 2 3 
                                             OpStore %120 %124 
                                             OpBranch %122 
                                    %125 = OpLabel 
                              f32_2 %126 = OpLoad %78 
                                             OpStore %120 %126 
                                             OpBranch %122 
                                    %122 = OpLabel 
                              f32_2 %127 = OpLoad %120 
                                             OpStore %78 %127 
                      Private bool* %129 = OpAccessChain %92 %128 
                               bool %130 = OpLoad %129 
                                             OpSelectionMerge %133 None 
                                             OpBranchConditional %130 %132 %136 
                                    %132 = OpLabel 
                              f32_4 %134 = OpLoad %71 
                              f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                             OpStore %131 %135 
                                             OpBranch %133 
                                    %136 = OpLabel 
                              f32_2 %137 = OpLoad %78 
                                             OpStore %131 %137 
                                             OpBranch %133 
                                    %133 = OpLabel 
                              f32_2 %138 = OpLoad %131 
                                             OpStore %78 %138 
                      Private bool* %139 = OpAccessChain %92 %25 
                               bool %140 = OpLoad %139 
                                             OpSelectionMerge %143 None 
                                             OpBranchConditional %140 %142 %146 
                                    %142 = OpLabel 
                              f32_4 %144 = OpLoad %55 
                              f32_2 %145 = OpVectorShuffle %144 %144 2 3 
                                             OpStore %141 %145 
                                             OpBranch %143 
                                    %146 = OpLabel 
                              f32_2 %147 = OpLoad %78 
                                             OpStore %141 %147 
                                             OpBranch %143 
                                    %143 = OpLabel 
                              f32_2 %148 = OpLoad %141 
                              f32_4 %149 = OpLoad %55 
                              f32_4 %150 = OpVectorShuffle %149 %148 4 5 2 3 
                                             OpStore %55 %150 
                       Private f32* %152 = OpAccessChain %55 %117 
                                             OpStore %152 %151 
                       Private f32* %154 = OpAccessChain %55 %101 
                                             OpStore %154 %153 
                read_only Texture2D %155 = OpLoad %12 
                            sampler %156 = OpLoad %16 
         read_only Texture2DSampled %157 = OpSampledImage %155 %156 
                              f32_4 %158 = OpLoad %55 
                              f32_2 %159 = OpVectorShuffle %158 %158 0 2 
                              f32_4 %160 = OpImageSampleImplicitLod %157 %159 
                                f32 %161 = OpCompositeExtract %160 0 
                       Private f32* %162 = OpAccessChain %78 %25 
                                             OpStore %162 %161 
                read_only Texture2D %163 = OpLoad %12 
                            sampler %164 = OpLoad %16 
         read_only Texture2DSampled %165 = OpSampledImage %163 %164 
                              f32_4 %166 = OpLoad %55 
                              f32_2 %167 = OpVectorShuffle %166 %166 0 3 
                              f32_4 %168 = OpImageSampleImplicitLod %165 %167 
                                f32 %169 = OpCompositeExtract %168 0 
                       Private f32* %170 = OpAccessChain %78 %128 
                                             OpStore %170 %169 
                       Private f32* %171 = OpAccessChain %78 %25 
                                f32 %172 = OpLoad %171 
                                f32 %173 = OpExtInst %1 30 %172 
                       Private f32* %174 = OpAccessChain %78 %25 
                                             OpStore %174 %173 
                       Private f32* %175 = OpAccessChain %78 %25 
                                f32 %176 = OpLoad %175 
                                f32 %178 = OpFMul %176 %177 
                       Private f32* %179 = OpAccessChain %78 %25 
                                             OpStore %179 %178 
                              f32_2 %180 = OpLoad %78 
                              f32_2 %181 = OpExtInst %1 13 %180 
                                             OpStore %78 %181 
                       Private f32* %182 = OpAccessChain %78 %25 
                                f32 %183 = OpLoad %182 
                                f32 %185 = OpFMul %183 %184 
                       Private f32* %186 = OpAccessChain %78 %25 
                                             OpStore %186 %185 
                              f32_2 %187 = OpLoad %78 
                              f32_2 %188 = OpVectorShuffle %187 %187 0 0 
                              f32_4 %189 = OpLoad %55 
                              f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                              f32_2 %191 = OpFMul %188 %190 
                              f32_4 %192 = OpLoad %55 
                              f32_4 %193 = OpVectorShuffle %192 %191 0 4 5 3 
                                             OpStore %55 %193 
                       Private f32* %194 = OpAccessChain %9 %25 
                                f32 %195 = OpLoad %194 
                                f32 %196 = OpExtInst %1 14 %195 
                       Private f32* %197 = OpAccessChain %78 %25 
                                             OpStore %197 %196 
                              f32_4 %198 = OpLoad %9 
                              f32_3 %199 = OpVectorShuffle %198 %198 0 0 0 
                              f32_3 %204 = OpFMul %199 %203 
                              f32_4 %205 = OpLoad %71 
                              f32_4 %206 = OpVectorShuffle %205 %204 4 5 6 3 
                                             OpStore %71 %206 
                       Private f32* %207 = OpAccessChain %55 %117 
                                f32 %208 = OpLoad %207 
                                f32 %210 = OpFMul %208 %209 
                       Private f32* %211 = OpAccessChain %78 %25 
                                f32 %212 = OpLoad %211 
                                f32 %213 = OpFAdd %210 %212 
                       Private f32* %214 = OpAccessChain %9 %25 
                                             OpStore %214 %213 
                       Private f32* %215 = OpAccessChain %9 %25 
                                f32 %216 = OpLoad %215 
                                f32 %217 = OpExtInst %1 13 %216 
                       Private f32* %218 = OpAccessChain %9 %25 
                                             OpStore %218 %217 
                       Private f32* %219 = OpAccessChain %78 %128 
                                f32 %220 = OpLoad %219 
                       Private f32* %221 = OpAccessChain %9 %25 
                                f32 %222 = OpLoad %221 
                                f32 %223 = OpFMul %220 %222 
                       Private f32* %224 = OpAccessChain %55 %128 
                                f32 %225 = OpLoad %224 
                                f32 %226 = OpFAdd %223 %225 
                       Private f32* %227 = OpAccessChain %9 %25 
                                             OpStore %227 %226 
                       Private f32* %229 = OpAccessChain %78 %128 
                                f32 %230 = OpLoad %229 
                               bool %231 = OpFOrdLessThan %230 %21 
                                             OpStore %228 %231 
                               bool %232 = OpLoad %228 
                                             OpSelectionMerge %236 None 
                                             OpBranchConditional %232 %235 %239 
                                    %235 = OpLabel 
                       Private f32* %237 = OpAccessChain %9 %25 
                                f32 %238 = OpLoad %237 
                                             OpStore %234 %238 
                                             OpBranch %236 
                                    %239 = OpLabel 
                       Private f32* %240 = OpAccessChain %55 %128 
                                f32 %241 = OpLoad %240 
                                             OpStore %234 %241 
                                             OpBranch %236 
                                    %236 = OpLabel 
                                f32 %242 = OpLoad %234 
                       Private f32* %243 = OpAccessChain %55 %25 
                                             OpStore %243 %242 
                       Private f32* %244 = OpAccessChain %71 %25 
                                f32 %245 = OpLoad %244 
                                f32 %246 = OpExtInst %1 13 %245 
                       Private f32* %247 = OpAccessChain %9 %25 
                                             OpStore %247 %246 
                              f32_4 %248 = OpLoad %71 
                              f32_2 %249 = OpVectorShuffle %248 %248 1 2 
                              f32_2 %250 = OpExtInst %1 14 %249 
                              f32_4 %251 = OpLoad %9 
                              f32_4 %252 = OpVectorShuffle %251 %250 0 1 4 5 
                                             OpStore %9 %252 
                              f32_4 %253 = OpLoad %9 
                              f32_2 %254 = OpVectorShuffle %253 %253 0 0 
                              f32_4 %255 = OpLoad %55 
                              f32_2 %256 = OpVectorShuffle %255 %255 0 2 
                              f32_2 %257 = OpFMul %254 %256 
                              f32_4 %258 = OpLoad %55 
                              f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                             OpStore %55 %259 
                              f32_4 %261 = OpLoad %55 
                              f32_2 %262 = OpVectorShuffle %261 %261 0 1 
                              f32_2 %263 = OpExtInst %1 10 %262 
                                             OpStore %260 %263 
                              f32_4 %264 = OpLoad %55 
                              f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                              f32_2 %266 = OpExtInst %1 8 %265 
                              f32_4 %267 = OpLoad %55 
                              f32_4 %268 = OpVectorShuffle %267 %266 4 5 2 3 
                                             OpStore %55 %268 
                       Private f32* %269 = OpAccessChain %55 %128 
                                f32 %270 = OpLoad %269 
                                f32 %272 = OpFMul %270 %271 
                       Private f32* %273 = OpAccessChain %55 %25 
                                f32 %274 = OpLoad %273 
                                f32 %275 = OpFAdd %272 %274 
                       Private f32* %276 = OpAccessChain %9 %25 
                                             OpStore %276 %275 
                              f32_2 %277 = OpLoad %260 
                              f32_2 %278 = OpLoad %260 
                              f32_2 %279 = OpFMul %277 %278 
                              f32_4 %280 = OpLoad %55 
                              f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                             OpStore %55 %281 
                              f32_2 %282 = OpLoad %260 
                              f32_2 %283 = OpFNegate %282 
                              f32_2 %286 = OpFMul %283 %285 
                              f32_2 %289 = OpFAdd %286 %288 
                                             OpStore %260 %289 
                              f32_2 %290 = OpLoad %260 
                              f32_4 %291 = OpLoad %55 
                              f32_2 %292 = OpVectorShuffle %291 %291 0 1 
                              f32_2 %293 = OpFMul %290 %292 
                              f32_4 %294 = OpLoad %55 
                              f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
                                             OpStore %55 %295 
                              f32_4 %296 = OpLoad %9 
                              f32_3 %297 = OpVectorShuffle %296 %296 0 0 0 
                              f32_3 %300 = OpFAdd %297 %299 
                              f32_4 %301 = OpLoad %71 
                              f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                             OpStore %71 %302 
                       Private f32* %303 = OpAccessChain %9 %25 
                                f32 %304 = OpLoad %303 
                                f32 %305 = OpExtInst %1 13 %304 
                       Private f32* %306 = OpAccessChain %9 %25 
                                             OpStore %306 %305 
                              f32_4 %307 = OpLoad %9 
                              f32_3 %308 = OpVectorShuffle %307 %307 0 2 3 
                              f32_3 %311 = OpFMul %308 %310 
                              f32_4 %312 = OpLoad %9 
                              f32_4 %313 = OpVectorShuffle %312 %311 4 1 5 6 
                                             OpStore %9 %313 
                       Private f32* %314 = OpAccessChain %9 %25 
                                f32 %315 = OpLoad %314 
                                f32 %316 = OpExtInst %1 10 %315 
                       Private f32* %317 = OpAccessChain %9 %25 
                                             OpStore %317 %316 
                              f32_4 %318 = OpLoad %71 
                              f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                              f32_3 %320 = OpExtInst %1 13 %319 
                              f32_4 %321 = OpLoad %71 
                              f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                             OpStore %71 %322 
                              f32_4 %323 = OpLoad %71 
                              f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                              f32_3 %326 = OpFMul %324 %325 
                              f32_4 %327 = OpLoad %71 
                              f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                             OpStore %71 %328 
                              f32_4 %329 = OpLoad %71 
                              f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
                              f32_3 %331 = OpExtInst %1 10 %330 
                              f32_4 %332 = OpLoad %71 
                              f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
                                             OpStore %71 %333 
                       Private f32* %334 = OpAccessChain %71 %128 
                                f32 %335 = OpLoad %334 
                                f32 %336 = OpFNegate %335 
                       Private f32* %337 = OpAccessChain %71 %117 
                                f32 %338 = OpLoad %337 
                                f32 %339 = OpFAdd %336 %338 
                       Private f32* %340 = OpAccessChain %260 %25 
                                             OpStore %340 %339 
                       Private f32* %341 = OpAccessChain %55 %25 
                                f32 %342 = OpLoad %341 
                       Private f32* %343 = OpAccessChain %260 %25 
                                f32 %344 = OpLoad %343 
                                f32 %345 = OpFMul %342 %344 
                       Private f32* %346 = OpAccessChain %71 %128 
                                f32 %347 = OpLoad %346 
                                f32 %348 = OpFAdd %345 %347 
                       Private f32* %349 = OpAccessChain %260 %25 
                                             OpStore %349 %348 
                       Private f32* %351 = OpAccessChain %9 %25 
                                f32 %352 = OpLoad %351 
                                f32 %353 = OpFNegate %352 
                       Private f32* %354 = OpAccessChain %71 %25 
                                f32 %355 = OpLoad %354 
                                f32 %356 = OpFAdd %353 %355 
                                             OpStore %350 %356 
                       Private f32* %357 = OpAccessChain %55 %25 
                                f32 %358 = OpLoad %357 
                                f32 %359 = OpLoad %350 
                                f32 %360 = OpFMul %358 %359 
                       Private f32* %361 = OpAccessChain %9 %25 
                                f32 %362 = OpLoad %361 
                                f32 %363 = OpFAdd %360 %362 
                       Private f32* %364 = OpAccessChain %9 %25 
                                             OpStore %364 %363 
                       Private f32* %365 = OpAccessChain %9 %25 
                                f32 %366 = OpLoad %365 
                                f32 %367 = OpFNegate %366 
                       Private f32* %368 = OpAccessChain %260 %25 
                                f32 %369 = OpLoad %368 
                                f32 %370 = OpFAdd %367 %369 
                       Private f32* %371 = OpAccessChain %55 %25 
                                             OpStore %371 %370 
                       Private f32* %372 = OpAccessChain %55 %128 
                                f32 %373 = OpLoad %372 
                       Private f32* %374 = OpAccessChain %55 %25 
                                f32 %375 = OpLoad %374 
                                f32 %376 = OpFMul %373 %375 
                       Private f32* %377 = OpAccessChain %9 %25 
                                f32 %378 = OpLoad %377 
                                f32 %379 = OpFAdd %376 %378 
                       Private f32* %380 = OpAccessChain %9 %25 
                                             OpStore %380 %379 
                              f32_4 %381 = OpLoad %9 
                              f32_2 %382 = OpVectorShuffle %381 %381 0 0 
                              f32_2 %385 = OpFMul %382 %384 
                              f32_4 %386 = OpLoad %9 
                              f32_2 %387 = OpVectorShuffle %386 %386 2 3 
                              f32_2 %388 = OpFAdd %385 %387 
                                             OpStore %37 %388 
                       Private f32* %389 = OpAccessChain %78 %25 
                                f32 %390 = OpLoad %389 
                       Private f32* %391 = OpAccessChain %9 %25 
                                f32 %392 = OpLoad %391 
                                f32 %393 = OpFMul %390 %392 
                       Private f32* %394 = OpAccessChain %9 %25 
                                             OpStore %394 %393 
                       Private f32* %395 = OpAccessChain %9 %25 
                                f32 %396 = OpLoad %395 
                                f32 %398 = OpFMul %396 %397 
                       Private f32* %399 = OpAccessChain %9 %25 
                                             OpStore %399 %398 
                       Private f32* %400 = OpAccessChain %9 %25 
                                f32 %401 = OpLoad %400 
                                f32 %402 = OpExtInst %1 13 %401 
                       Private f32* %403 = OpAccessChain %9 %25 
                                             OpStore %403 %402 
                       Private f32* %404 = OpAccessChain %9 %25 
                                f32 %405 = OpLoad %404 
                                f32 %406 = OpFMul %405 %309 
                       Private f32* %407 = OpAccessChain %9 %25 
                                             OpStore %407 %406 
                       Private f32* %408 = OpAccessChain %9 %25 
                                f32 %409 = OpLoad %408 
                                f32 %410 = OpExtInst %1 10 %409 
                       Private f32* %411 = OpAccessChain %55 %25 
                                             OpStore %411 %410 
                              f32_2 %412 = OpLoad %37 
                              f32_2 %413 = OpExtInst %1 13 %412 
                              f32_4 %414 = OpLoad %9 
                              f32_4 %415 = OpVectorShuffle %414 %413 4 5 2 3 
                                             OpStore %9 %415 
                              f32_4 %416 = OpLoad %9 
                              f32_2 %417 = OpVectorShuffle %416 %416 0 1 
                              f32_2 %419 = OpFMul %417 %418 
                              f32_4 %420 = OpLoad %9 
                              f32_4 %421 = OpVectorShuffle %420 %419 4 5 2 3 
                                             OpStore %9 %421 
                              f32_4 %422 = OpLoad %9 
                              f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                              f32_2 %424 = OpExtInst %1 10 %423 
                              f32_4 %425 = OpLoad %55 
                              f32_4 %426 = OpVectorShuffle %425 %424 0 4 5 3 
                                             OpStore %55 %426 
                              f32_4 %427 = OpLoad %55 
                              f32_3 %428 = OpVectorShuffle %427 %427 0 1 2 
                              f32_3 %429 = OpLoad %64 
                              f32_3 %430 = OpFMul %428 %429 
                              f32_3 %431 = OpLoad %64 
                              f32_3 %432 = OpFNegate %431 
                              f32_3 %433 = OpFAdd %430 %432 
                              f32_4 %434 = OpLoad %9 
                              f32_4 %435 = OpVectorShuffle %434 %433 4 5 6 3 
                                             OpStore %9 %435 
                       Uniform f32* %440 = OpAccessChain %43 %438 
                                f32 %441 = OpLoad %440 
                       Uniform f32* %442 = OpAccessChain %43 %438 
                                f32 %443 = OpLoad %442 
                       Uniform f32* %444 = OpAccessChain %43 %438 
                                f32 %445 = OpLoad %444 
                              f32_3 %446 = OpCompositeConstruct %441 %443 %445 
                                f32 %447 = OpCompositeExtract %446 0 
                                f32 %448 = OpCompositeExtract %446 1 
                                f32 %449 = OpCompositeExtract %446 2 
                              f32_3 %450 = OpCompositeConstruct %447 %448 %449 
                              f32_4 %451 = OpLoad %9 
                              f32_3 %452 = OpVectorShuffle %451 %451 0 1 2 
                              f32_3 %453 = OpFMul %450 %452 
                              f32_3 %454 = OpLoad %64 
                              f32_3 %455 = OpFAdd %453 %454 
                              f32_4 %456 = OpLoad %437 
                              f32_4 %457 = OpVectorShuffle %456 %455 4 5 6 3 
                                             OpStore %437 %457 
                        Output f32* %459 = OpAccessChain %437 %101 
                                             OpStore %459 %34 
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