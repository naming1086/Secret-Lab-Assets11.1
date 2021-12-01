//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Gradients_Desert" {
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
  GpuProgramID 35805
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat5;
float u_xlat8;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0.x = float(-0.699999988);
    u_xlat0.z = float(-0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat9 = dot(u_xlat1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat10 = u_xlat9 * -2.0 + 1.0;
    u_xlat9 = _Value * u_xlat10 + u_xlat9;
    u_xlat10 = (-u_xlat9) * 20.0 + 0.800000012;
    u_xlat0.y = max(u_xlat10, 0.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(0.850000024, 0.449999988, 0.5);
    u_xlat10 = u_xlat9 * 2.5;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyz + vec3(0.699999988, 0.300000012, 0.0);
    u_xlat10 = u_xlat9 + -0.400000006;
    u_xlatb9 = 0.400000006<u_xlat9;
    u_xlat2.x = u_xlat10 * 2.00000024;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat5 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat5;
    u_xlat2.xy = u_xlat2.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
    u_xlat8 = (-u_xlat10) * 1.66666663 + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat10 = -abs(u_xlat10) + 1.0;
    u_xlat10 = u_xlat10 * 1.5;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat2.xy = vec2(u_xlat8) * u_xlat2.xy;
    u_xlat2.z = 1.0;
    u_xlat2.xyz = sqrt(u_xlat2.xyz);
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat10) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 226
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %203 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpMemberDecorate %24 0 Offset 24 
                                             OpMemberDecorate %24 1 Offset 24 
                                             OpMemberDecorate %24 2 Offset 24 
                                             OpDecorate %24 Block 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %203 Location 203 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                 f32 %10 = OpConstant 3.674022E-40 
                                     %11 = OpTypeInt 32 0 
                                 u32 %12 = OpConstant 0 
                                     %13 = OpTypePointer Private %6 
                                 f32 %15 = OpConstant 3.674022E-40 
                                 u32 %16 = OpConstant 2 
                      Private f32_3* %18 = OpVariable Private 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %24 = OpTypeStruct %6 %6 %23 
                                     %25 = OpTypePointer Uniform %24 
  Uniform struct {f32; f32; f32_4;}* %26 = OpVariable Uniform 
                                     %27 = OpTypeInt 32 1 
                                 i32 %28 = OpConstant 2 
                                     %29 = OpTypePointer Uniform %23 
                                     %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %41 = OpTypePointer UniformConstant %40 
UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
                                     %44 = OpTypeSampler 
                                     %45 = OpTypePointer UniformConstant %44 
            UniformConstant sampler* %46 = OpVariable UniformConstant 
                                     %48 = OpTypeSampledImage %40 
                        Private f32* %54 = OpVariable Private 
                                 f32 %56 = OpConstant 3.674022E-40 
                                 f32 %57 = OpConstant 3.674022E-40 
                                 f32 %58 = OpConstant 3.674022E-40 
                               f32_3 %59 = OpConstantComposite %56 %57 %58 
                        Private f32* %61 = OpVariable Private 
                                 f32 %63 = OpConstant 3.674022E-40 
                                 f32 %65 = OpConstant 3.674022E-40 
                                 i32 %67 = OpConstant 0 
                                     %68 = OpTypePointer Uniform %6 
                                 f32 %77 = OpConstant 3.674022E-40 
                                 f32 %79 = OpConstant 3.674022E-40 
                                 f32 %82 = OpConstant 3.674022E-40 
                                 u32 %84 = OpConstant 1 
                                 f32 %87 = OpConstant 3.674022E-40 
                                 f32 %88 = OpConstant 3.674022E-40 
                                 f32 %89 = OpConstant 3.674022E-40 
                               f32_3 %90 = OpConstantComposite %87 %88 %89 
                                 f32 %93 = OpConstant 3.674022E-40 
                                f32 %102 = OpConstant 3.674022E-40 
                                f32 %103 = OpConstant 3.674022E-40 
                              f32_3 %104 = OpConstantComposite %102 %103 %82 
                                f32 %107 = OpConstant 3.674022E-40 
                                    %109 = OpTypeBool 
                                    %110 = OpTypePointer Private %109 
                      Private bool* %111 = OpVariable Private 
                                f32 %112 = OpConstant 3.674022E-40 
                     Private f32_3* %115 = OpVariable Private 
                                f32 %117 = OpConstant 3.674022E-40 
                       Private f32* %127 = OpVariable Private 
                                f32 %131 = OpConstant 3.674022E-40 
                                f32 %146 = OpConstant 3.674022E-40 
                                f32 %147 = OpConstant 3.674022E-40 
                              f32_2 %148 = OpConstantComposite %146 %147 
                              f32_2 %150 = OpConstantComposite %65 %65 
                       Private f32* %154 = OpVariable Private 
                                f32 %157 = OpConstant 3.674022E-40 
                                f32 %167 = OpConstant 3.674022E-40 
                                    %184 = OpTypePointer Function %7 
                              f32_3 %193 = OpConstantComposite %65 %65 %65 
                                    %202 = OpTypePointer Output %23 
                      Output f32_4* %203 = OpVariable Output 
                                i32 %204 = OpConstant 1 
                                u32 %222 = OpConstant 3 
                                    %223 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %185 = OpVariable Function 
                        Private f32* %14 = OpAccessChain %9 %12 
                                             OpStore %14 %10 
                        Private f32* %17 = OpAccessChain %9 %16 
                                             OpStore %17 %15 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                      Uniform f32_4* %30 = OpAccessChain %26 %28 
                               f32_4 %31 = OpLoad %30 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpFMul %22 %32 
                      Uniform f32_4* %34 = OpAccessChain %26 %28 
                               f32_4 %35 = OpLoad %34 
                               f32_2 %36 = OpVectorShuffle %35 %35 2 3 
                               f32_2 %37 = OpFAdd %33 %36 
                               f32_3 %38 = OpLoad %18 
                               f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                             OpStore %18 %39 
                 read_only Texture2D %43 = OpLoad %42 
                             sampler %47 = OpLoad %46 
          read_only Texture2DSampled %49 = OpSampledImage %43 %47 
                               f32_3 %50 = OpLoad %18 
                               f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                             OpStore %18 %53 
                               f32_3 %55 = OpLoad %18 
                                 f32 %60 = OpDot %55 %59 
                                             OpStore %54 %60 
                                 f32 %62 = OpLoad %54 
                                 f32 %64 = OpFMul %62 %63 
                                 f32 %66 = OpFAdd %64 %65 
                                             OpStore %61 %66 
                        Uniform f32* %69 = OpAccessChain %26 %67 
                                 f32 %70 = OpLoad %69 
                                 f32 %71 = OpLoad %61 
                                 f32 %72 = OpFMul %70 %71 
                                 f32 %73 = OpLoad %54 
                                 f32 %74 = OpFAdd %72 %73 
                                             OpStore %54 %74 
                                 f32 %75 = OpLoad %54 
                                 f32 %76 = OpFNegate %75 
                                 f32 %78 = OpFMul %76 %77 
                                 f32 %80 = OpFAdd %78 %79 
                                             OpStore %61 %80 
                                 f32 %81 = OpLoad %61 
                                 f32 %83 = OpExtInst %1 40 %81 %82 
                        Private f32* %85 = OpAccessChain %9 %84 
                                             OpStore %85 %83 
                               f32_3 %86 = OpLoad %9 
                               f32_3 %91 = OpFAdd %86 %90 
                                             OpStore %9 %91 
                                 f32 %92 = OpLoad %54 
                                 f32 %94 = OpFMul %92 %93 
                                             OpStore %61 %94 
                                 f32 %95 = OpLoad %61 
                                 f32 %96 = OpLoad %61 
                                 f32 %97 = OpFMul %95 %96 
                                             OpStore %61 %97 
                                 f32 %98 = OpLoad %61 
                               f32_3 %99 = OpCompositeConstruct %98 %98 %98 
                              f32_3 %100 = OpLoad %9 
                              f32_3 %101 = OpFMul %99 %100 
                              f32_3 %105 = OpFAdd %101 %104 
                                             OpStore %9 %105 
                                f32 %106 = OpLoad %54 
                                f32 %108 = OpFAdd %106 %107 
                                             OpStore %61 %108 
                                f32 %113 = OpLoad %54 
                               bool %114 = OpFOrdLessThan %112 %113 
                                             OpStore %111 %114 
                                f32 %116 = OpLoad %61 
                                f32 %118 = OpFMul %116 %117 
                       Private f32* %119 = OpAccessChain %115 %12 
                                             OpStore %119 %118 
                       Private f32* %120 = OpAccessChain %115 %12 
                                f32 %121 = OpLoad %120 
                       Private f32* %122 = OpAccessChain %115 %12 
                                             OpStore %122 %121 
                       Private f32* %123 = OpAccessChain %115 %12 
                                f32 %124 = OpLoad %123 
                                f32 %125 = OpExtInst %1 43 %124 %82 %65 
                       Private f32* %126 = OpAccessChain %115 %12 
                                             OpStore %126 %125 
                       Private f32* %128 = OpAccessChain %115 %12 
                                f32 %129 = OpLoad %128 
                                f32 %130 = OpFMul %129 %63 
                                f32 %132 = OpFAdd %130 %131 
                                             OpStore %127 %132 
                       Private f32* %133 = OpAccessChain %115 %12 
                                f32 %134 = OpLoad %133 
                       Private f32* %135 = OpAccessChain %115 %12 
                                f32 %136 = OpLoad %135 
                                f32 %137 = OpFMul %134 %136 
                       Private f32* %138 = OpAccessChain %115 %12 
                                             OpStore %138 %137 
                       Private f32* %139 = OpAccessChain %115 %12 
                                f32 %140 = OpLoad %139 
                                f32 %141 = OpLoad %127 
                                f32 %142 = OpFMul %140 %141 
                       Private f32* %143 = OpAccessChain %115 %12 
                                             OpStore %143 %142 
                              f32_3 %144 = OpLoad %115 
                              f32_2 %145 = OpVectorShuffle %144 %144 0 0 
                              f32_2 %149 = OpFMul %145 %148 
                              f32_2 %151 = OpFAdd %149 %150 
                              f32_3 %152 = OpLoad %115 
                              f32_3 %153 = OpVectorShuffle %152 %151 3 4 2 
                                             OpStore %115 %153 
                                f32 %155 = OpLoad %61 
                                f32 %156 = OpFNegate %155 
                                f32 %158 = OpFMul %156 %157 
                                f32 %159 = OpFAdd %158 %65 
                                             OpStore %154 %159 
                                f32 %160 = OpLoad %154 
                                f32 %161 = OpExtInst %1 43 %160 %82 %65 
                                             OpStore %154 %161 
                                f32 %162 = OpLoad %61 
                                f32 %163 = OpExtInst %1 4 %162 
                                f32 %164 = OpFNegate %163 
                                f32 %165 = OpFAdd %164 %65 
                                             OpStore %61 %165 
                                f32 %166 = OpLoad %61 
                                f32 %168 = OpFMul %166 %167 
                                             OpStore %61 %168 
                                f32 %169 = OpLoad %61 
                                f32 %170 = OpExtInst %1 43 %169 %82 %65 
                                             OpStore %61 %170 
                                f32 %171 = OpLoad %154 
                                f32 %172 = OpExtInst %1 31 %171 
                                             OpStore %154 %172 
                                f32 %173 = OpLoad %154 
                              f32_2 %174 = OpCompositeConstruct %173 %173 
                              f32_3 %175 = OpLoad %115 
                              f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                              f32_2 %177 = OpFMul %174 %176 
                              f32_3 %178 = OpLoad %115 
                              f32_3 %179 = OpVectorShuffle %178 %177 3 4 2 
                                             OpStore %115 %179 
                       Private f32* %180 = OpAccessChain %115 %16 
                                             OpStore %180 %65 
                              f32_3 %181 = OpLoad %115 
                              f32_3 %182 = OpExtInst %1 31 %181 
                                             OpStore %115 %182 
                               bool %183 = OpLoad %111 
                                             OpSelectionMerge %187 None 
                                             OpBranchConditional %183 %186 %189 
                                    %186 = OpLabel 
                              f32_3 %188 = OpLoad %115 
                                             OpStore %185 %188 
                                             OpBranch %187 
                                    %189 = OpLabel 
                              f32_3 %190 = OpLoad %9 
                                             OpStore %185 %190 
                                             OpBranch %187 
                                    %187 = OpLabel 
                              f32_3 %191 = OpLoad %185 
                                             OpStore %9 %191 
                              f32_3 %192 = OpLoad %9 
                              f32_3 %194 = OpExtInst %1 37 %192 %193 
                                             OpStore %9 %194 
                              f32_3 %195 = OpLoad %9 
                                f32 %196 = OpLoad %61 
                              f32_3 %197 = OpCompositeConstruct %196 %196 %196 
                              f32_3 %198 = OpFMul %195 %197 
                              f32_3 %199 = OpLoad %18 
                              f32_3 %200 = OpFNegate %199 
                              f32_3 %201 = OpFAdd %198 %200 
                                             OpStore %9 %201 
                       Uniform f32* %205 = OpAccessChain %26 %204 
                                f32 %206 = OpLoad %205 
                       Uniform f32* %207 = OpAccessChain %26 %204 
                                f32 %208 = OpLoad %207 
                       Uniform f32* %209 = OpAccessChain %26 %204 
                                f32 %210 = OpLoad %209 
                              f32_3 %211 = OpCompositeConstruct %206 %208 %210 
                                f32 %212 = OpCompositeExtract %211 0 
                                f32 %213 = OpCompositeExtract %211 1 
                                f32 %214 = OpCompositeExtract %211 2 
                              f32_3 %215 = OpCompositeConstruct %212 %213 %214 
                              f32_3 %216 = OpLoad %9 
                              f32_3 %217 = OpFMul %215 %216 
                              f32_3 %218 = OpLoad %18 
                              f32_3 %219 = OpFAdd %217 %218 
                              f32_4 %220 = OpLoad %203 
                              f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                             OpStore %203 %221 
                        Output f32* %224 = OpAccessChain %203 %222 
                                             OpStore %224 %65 
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