//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_InverChromiLum" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 19000
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
float u_xlat2;
float u_xlat4;
bool u_xlatb4;
bool u_xlatb7;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4 = u_xlat1.x * u_xlat4 + 0.180141002;
    u_xlat4 = u_xlat1.x * u_xlat4 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4 + 0.999866009;
    u_xlat4 = u_xlat9 * u_xlat1.x;
    u_xlat4 = u_xlat4 * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.x);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4 = max(u_xlat0.y, u_xlat0.x);
    u_xlatb4 = u_xlat4>=(-u_xlat4);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat1.y = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat9 = u_xlat1.y * 0.636619925;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.z + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 2.09439349;
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat2 * 0.5 + 0.5;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.xz = u_xlat0.yx * vec2(u_xlat9);
    SV_Target0.xyz = u_xlat1.xyz * vec3(2.0, 0.127323985, 2.0);
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
; Bound: 243
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %231 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %231 Location 231 
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
                                     %15 = OpTypeStruct %14 
                                     %16 = OpTypePointer Uniform %15 
            Uniform struct {f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 0 
                                     %20 = OpTypePointer Uniform %14 
                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %32 = OpTypePointer UniformConstant %31 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                     %35 = OpTypeSampler 
                                     %36 = OpTypePointer UniformConstant %35 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampledImage %31 
                                     %45 = OpTypePointer Private %6 
                        Private f32* %46 = OpVariable Private 
                                     %47 = OpTypeInt 32 0 
                                 u32 %48 = OpConstant 1 
                                 u32 %52 = OpConstant 0 
                                 f32 %57 = OpConstant 3.674022E-40 
                      Private f32_3* %60 = OpVariable Private 
                        Private f32* %77 = OpVariable Private 
                                 f32 %80 = OpConstant 3.674022E-40 
                                 f32 %82 = OpConstant 3.674022E-40 
                                 f32 %88 = OpConstant 3.674022E-40 
                                 f32 %94 = OpConstant 3.674022E-40 
                                f32 %100 = OpConstant 3.674022E-40 
                                f32 %108 = OpConstant 3.674022E-40 
                                f32 %110 = OpConstant 3.674022E-40 
                                    %112 = OpTypeBool 
                                    %113 = OpTypePointer Private %112 
                      Private bool* %114 = OpVariable Private 
                                f32 %124 = OpConstant 3.674022E-40 
                      Private bool* %132 = OpVariable Private 
                                f32 %140 = OpConstant 3.674022E-40 
                      Private bool* %164 = OpVariable Private 
                                    %173 = OpTypePointer Function %6 
                                f32 %185 = OpConstant 3.674022E-40 
                                u32 %193 = OpConstant 2 
                                f32 %202 = OpConstant 3.674022E-40 
                       Private f32* %205 = OpVariable Private 
                                f32 %214 = OpConstant 3.674022E-40 
                                    %230 = OpTypePointer Output %14 
                      Output f32_4* %231 = OpVariable Output 
                                f32 %233 = OpConstant 3.674022E-40 
                                f32 %234 = OpConstant 3.674022E-40 
                              f32_3 %235 = OpConstantComposite %233 %234 %233 
                                u32 %239 = OpConstant 3 
                                    %240 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Function f32* %174 = OpVariable Function 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                               f32_3 %41 = OpLoad %9 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                             OpStore %9 %44 
                        Private f32* %49 = OpAccessChain %9 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpExtInst %1 4 %50 
                        Private f32* %53 = OpAccessChain %9 %52 
                                 f32 %54 = OpLoad %53 
                                 f32 %55 = OpExtInst %1 4 %54 
                                 f32 %56 = OpExtInst %1 40 %51 %55 
                                             OpStore %46 %56 
                                 f32 %58 = OpLoad %46 
                                 f32 %59 = OpFDiv %57 %58 
                                             OpStore %46 %59 
                        Private f32* %61 = OpAccessChain %9 %48 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpExtInst %1 4 %62 
                        Private f32* %64 = OpAccessChain %9 %52 
                                 f32 %65 = OpLoad %64 
                                 f32 %66 = OpExtInst %1 4 %65 
                                 f32 %67 = OpExtInst %1 37 %63 %66 
                        Private f32* %68 = OpAccessChain %60 %52 
                                             OpStore %68 %67 
                                 f32 %69 = OpLoad %46 
                        Private f32* %70 = OpAccessChain %60 %52 
                                 f32 %71 = OpLoad %70 
                                 f32 %72 = OpFMul %69 %71 
                                             OpStore %46 %72 
                                 f32 %73 = OpLoad %46 
                                 f32 %74 = OpLoad %46 
                                 f32 %75 = OpFMul %73 %74 
                        Private f32* %76 = OpAccessChain %60 %52 
                                             OpStore %76 %75 
                        Private f32* %78 = OpAccessChain %60 %52 
                                 f32 %79 = OpLoad %78 
                                 f32 %81 = OpFMul %79 %80 
                                 f32 %83 = OpFAdd %81 %82 
                                             OpStore %77 %83 
                        Private f32* %84 = OpAccessChain %60 %52 
                                 f32 %85 = OpLoad %84 
                                 f32 %86 = OpLoad %77 
                                 f32 %87 = OpFMul %85 %86 
                                 f32 %89 = OpFAdd %87 %88 
                                             OpStore %77 %89 
                        Private f32* %90 = OpAccessChain %60 %52 
                                 f32 %91 = OpLoad %90 
                                 f32 %92 = OpLoad %77 
                                 f32 %93 = OpFMul %91 %92 
                                 f32 %95 = OpFAdd %93 %94 
                                             OpStore %77 %95 
                        Private f32* %96 = OpAccessChain %60 %52 
                                 f32 %97 = OpLoad %96 
                                 f32 %98 = OpLoad %77 
                                 f32 %99 = OpFMul %97 %98 
                                f32 %101 = OpFAdd %99 %100 
                       Private f32* %102 = OpAccessChain %60 %52 
                                             OpStore %102 %101 
                                f32 %103 = OpLoad %46 
                       Private f32* %104 = OpAccessChain %60 %52 
                                f32 %105 = OpLoad %104 
                                f32 %106 = OpFMul %103 %105 
                                             OpStore %77 %106 
                                f32 %107 = OpLoad %77 
                                f32 %109 = OpFMul %107 %108 
                                f32 %111 = OpFAdd %109 %110 
                                             OpStore %77 %111 
                       Private f32* %115 = OpAccessChain %9 %48 
                                f32 %116 = OpLoad %115 
                                f32 %117 = OpExtInst %1 4 %116 
                       Private f32* %118 = OpAccessChain %9 %52 
                                f32 %119 = OpLoad %118 
                                f32 %120 = OpExtInst %1 4 %119 
                               bool %121 = OpFOrdLessThan %117 %120 
                                             OpStore %114 %121 
                               bool %122 = OpLoad %114 
                                f32 %123 = OpLoad %77 
                                f32 %125 = OpSelect %122 %123 %124 
                                             OpStore %77 %125 
                                f32 %126 = OpLoad %46 
                       Private f32* %127 = OpAccessChain %60 %52 
                                f32 %128 = OpLoad %127 
                                f32 %129 = OpFMul %126 %128 
                                f32 %130 = OpLoad %77 
                                f32 %131 = OpFAdd %129 %130 
                                             OpStore %46 %131 
                       Private f32* %133 = OpAccessChain %9 %48 
                                f32 %134 = OpLoad %133 
                       Private f32* %135 = OpAccessChain %9 %48 
                                f32 %136 = OpLoad %135 
                                f32 %137 = OpFNegate %136 
                               bool %138 = OpFOrdLessThan %134 %137 
                                             OpStore %132 %138 
                               bool %139 = OpLoad %132 
                                f32 %141 = OpSelect %139 %140 %124 
                       Private f32* %142 = OpAccessChain %60 %52 
                                             OpStore %142 %141 
                                f32 %143 = OpLoad %46 
                       Private f32* %144 = OpAccessChain %60 %52 
                                f32 %145 = OpLoad %144 
                                f32 %146 = OpFAdd %143 %145 
                                             OpStore %46 %146 
                       Private f32* %147 = OpAccessChain %9 %48 
                                f32 %148 = OpLoad %147 
                       Private f32* %149 = OpAccessChain %9 %52 
                                f32 %150 = OpLoad %149 
                                f32 %151 = OpExtInst %1 37 %148 %150 
                       Private f32* %152 = OpAccessChain %60 %52 
                                             OpStore %152 %151 
                       Private f32* %153 = OpAccessChain %60 %52 
                                f32 %154 = OpLoad %153 
                       Private f32* %155 = OpAccessChain %60 %52 
                                f32 %156 = OpLoad %155 
                                f32 %157 = OpFNegate %156 
                               bool %158 = OpFOrdLessThan %154 %157 
                                             OpStore %132 %158 
                       Private f32* %159 = OpAccessChain %9 %48 
                                f32 %160 = OpLoad %159 
                       Private f32* %161 = OpAccessChain %9 %52 
                                f32 %162 = OpLoad %161 
                                f32 %163 = OpExtInst %1 40 %160 %162 
                                             OpStore %77 %163 
                                f32 %165 = OpLoad %77 
                                f32 %166 = OpLoad %77 
                                f32 %167 = OpFNegate %166 
                               bool %168 = OpFOrdGreaterThanEqual %165 %167 
                                             OpStore %164 %168 
                               bool %169 = OpLoad %164 
                               bool %170 = OpLoad %132 
                               bool %171 = OpLogicalAnd %169 %170 
                                             OpStore %132 %171 
                               bool %172 = OpLoad %132 
                                             OpSelectionMerge %176 None 
                                             OpBranchConditional %172 %175 %179 
                                    %175 = OpLabel 
                                f32 %177 = OpLoad %46 
                                f32 %178 = OpFNegate %177 
                                             OpStore %174 %178 
                                             OpBranch %176 
                                    %179 = OpLabel 
                                f32 %180 = OpLoad %46 
                                             OpStore %174 %180 
                                             OpBranch %176 
                                    %176 = OpLabel 
                                f32 %181 = OpLoad %174 
                       Private f32* %182 = OpAccessChain %60 %48 
                                             OpStore %182 %181 
                       Private f32* %183 = OpAccessChain %60 %48 
                                f32 %184 = OpLoad %183 
                                f32 %186 = OpFMul %184 %185 
                                             OpStore %46 %186 
                       Private f32* %187 = OpAccessChain %9 %48 
                                f32 %188 = OpLoad %187 
                       Private f32* %189 = OpAccessChain %9 %52 
                                f32 %190 = OpLoad %189 
                                f32 %191 = OpFAdd %188 %190 
                       Private f32* %192 = OpAccessChain %9 %52 
                                             OpStore %192 %191 
                       Private f32* %194 = OpAccessChain %9 %193 
                                f32 %195 = OpLoad %194 
                       Private f32* %196 = OpAccessChain %9 %52 
                                f32 %197 = OpLoad %196 
                                f32 %198 = OpFAdd %195 %197 
                       Private f32* %199 = OpAccessChain %9 %52 
                                             OpStore %199 %198 
                       Private f32* %200 = OpAccessChain %9 %52 
                                f32 %201 = OpLoad %200 
                                f32 %203 = OpFMul %201 %202 
                       Private f32* %204 = OpAccessChain %9 %52 
                                             OpStore %204 %203 
                       Private f32* %206 = OpAccessChain %9 %52 
                                f32 %207 = OpLoad %206 
                                f32 %208 = OpExtInst %1 14 %207 
                                             OpStore %205 %208 
                       Private f32* %209 = OpAccessChain %9 %52 
                                f32 %210 = OpLoad %209 
                                f32 %211 = OpExtInst %1 13 %210 
                       Private f32* %212 = OpAccessChain %9 %52 
                                             OpStore %212 %211 
                                f32 %213 = OpLoad %205 
                                f32 %215 = OpFMul %213 %214 
                                f32 %216 = OpFAdd %215 %214 
                       Private f32* %217 = OpAccessChain %9 %48 
                                             OpStore %217 %216 
                       Private f32* %218 = OpAccessChain %9 %52 
                                f32 %219 = OpLoad %218 
                                f32 %220 = OpFMul %219 %214 
                                f32 %221 = OpFAdd %220 %214 
                       Private f32* %222 = OpAccessChain %9 %52 
                                             OpStore %222 %221 
                              f32_3 %223 = OpLoad %9 
                              f32_2 %224 = OpVectorShuffle %223 %223 1 0 
                                f32 %225 = OpLoad %46 
                              f32_2 %226 = OpCompositeConstruct %225 %225 
                              f32_2 %227 = OpFMul %224 %226 
                              f32_3 %228 = OpLoad %60 
                              f32_3 %229 = OpVectorShuffle %228 %227 3 1 4 
                                             OpStore %60 %229 
                              f32_3 %232 = OpLoad %60 
                              f32_3 %236 = OpFMul %232 %235 
                              f32_4 %237 = OpLoad %231 
                              f32_4 %238 = OpVectorShuffle %237 %236 4 5 6 3 
                                             OpStore %231 %238 
                        Output f32* %241 = OpAccessChain %231 %239 
                                             OpStore %241 %57 
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