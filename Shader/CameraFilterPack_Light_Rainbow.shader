//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Light_Rainbow" {
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
  GpuProgramID 25543
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat4;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat1.z = u_xlat1.y * _Value;
    u_xlat9 = u_xlat1.z * u_xlat1.x;
    u_xlat9 = u_xlat9 * 11.1000004 + _TimeX;
    u_xlat9 = sin(u_xlat9);
    u_xlat1.xy = vec2(u_xlat9) * vec2(0.150000006, 0.150000006) + u_xlat1.xz;
    u_xlat9 = _TimeX * 0.25;
    u_xlat9 = u_xlat1.x * 0.100000001 + u_xlat9;
    u_xlat1.xzw = vec3(u_xlat9) * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
    u_xlat2.xyz = u_xlat1.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat1.xzw = (-u_xlat2.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat1.xzw;
    u_xlat1.xzw = u_xlat1.xzw + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xzw = abs(u_xlat1.xzw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
    u_xlat9 = -abs(u_xlat1.y) + 0.699999988;
    u_xlat4 = u_xlat1.y * u_xlat1.y;
    u_xlat4 = u_xlat4 * 30.0;
    u_xlat4 = sin(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.25999999 + 1.0;
    u_xlat9 = u_xlat9 * 3.0;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
    SV_Target0.xyz = u_xlat1.xzw * vec3(u_xlat4) + u_xlat0.xyz;
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
; Bound: 206
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %192 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpMemberDecorate %15 2 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %192 Location 192 
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
                                     %15 = OpTypeStruct %6 %6 %14 
                                     %16 = OpTypePointer Uniform %15 
  Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                     %18 = OpTypeInt 32 1 
                                 i32 %19 = OpConstant 2 
                                     %20 = OpTypePointer Uniform %14 
                                     %31 = OpTypePointer Private %14 
                      Private f32_4* %32 = OpVariable Private 
                                 f32 %35 = OpConstant 3.674022E-40 
                               f32_2 %36 = OpConstantComposite %35 %35 
                                     %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %41 = OpTypePointer UniformConstant %40 
UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
                                     %44 = OpTypeSampler 
                                     %45 = OpTypePointer UniformConstant %44 
            UniformConstant sampler* %46 = OpVariable UniformConstant 
                                     %48 = OpTypeSampledImage %40 
                                 f32 %55 = OpConstant 3.674022E-40 
                               f32_3 %56 = OpConstantComposite %55 %55 %55 
                                     %58 = OpTypeInt 32 0 
                                 u32 %59 = OpConstant 1 
                                     %60 = OpTypePointer Private %6 
                                 i32 %63 = OpConstant 1 
                                     %64 = OpTypePointer Uniform %6 
                                 u32 %68 = OpConstant 2 
                        Private f32* %70 = OpVariable Private 
                                 u32 %73 = OpConstant 0 
                                 f32 %78 = OpConstant 3.674022E-40 
                                 i32 %80 = OpConstant 0 
                                 f32 %88 = OpConstant 3.674022E-40 
                               f32_2 %89 = OpConstantComposite %88 %88 
                                 f32 %98 = OpConstant 3.674022E-40 
                                f32 %102 = OpConstant 3.674022E-40 
                                f32 %108 = OpConstant 3.674022E-40 
                              f32_3 %109 = OpConstantComposite %108 %108 %108 
                                f32 %111 = OpConstant 3.674022E-40 
                                f32 %112 = OpConstant 3.674022E-40 
                                f32 %113 = OpConstant 3.674022E-40 
                              f32_3 %114 = OpConstantComposite %111 %112 %113 
                     Private f32_3* %118 = OpVariable Private 
                                f32 %121 = OpConstant 3.674022E-40 
                              f32_3 %122 = OpConstantComposite %121 %121 %121 
                                f32 %136 = OpConstant 3.674022E-40 
                              f32_3 %137 = OpConstantComposite %136 %136 %136 
                                f32 %144 = OpConstant 3.674022E-40 
                              f32_3 %145 = OpConstantComposite %144 %144 %144 
                                f32 %151 = OpConstant 3.674022E-40 
                                f32 %161 = OpConstant 3.674022E-40 
                       Private f32* %163 = OpVariable Private 
                                f32 %170 = OpConstant 3.674022E-40 
                                f32 %176 = OpConstant 3.674022E-40 
                                f32 %180 = OpConstant 3.674022E-40 
                                    %191 = OpTypePointer Output %14 
                      Output f32_4* %192 = OpVariable Output 
                                u32 %202 = OpConstant 3 
                                    %203 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
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
                               f32_4 %38 = OpLoad %32 
                               f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                             OpStore %32 %39 
                 read_only Texture2D %43 = OpLoad %42 
                             sampler %47 = OpLoad %46 
          read_only Texture2DSampled %49 = OpSampledImage %43 %47 
                               f32_3 %50 = OpLoad %9 
                               f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                               f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                             OpStore %9 %53 
                               f32_3 %54 = OpLoad %9 
                               f32_3 %57 = OpFMul %54 %56 
                                             OpStore %9 %57 
                        Private f32* %61 = OpAccessChain %32 %59 
                                 f32 %62 = OpLoad %61 
                        Uniform f32* %65 = OpAccessChain %17 %63 
                                 f32 %66 = OpLoad %65 
                                 f32 %67 = OpFMul %62 %66 
                        Private f32* %69 = OpAccessChain %32 %68 
                                             OpStore %69 %67 
                        Private f32* %71 = OpAccessChain %32 %68 
                                 f32 %72 = OpLoad %71 
                        Private f32* %74 = OpAccessChain %32 %73 
                                 f32 %75 = OpLoad %74 
                                 f32 %76 = OpFMul %72 %75 
                                             OpStore %70 %76 
                                 f32 %77 = OpLoad %70 
                                 f32 %79 = OpFMul %77 %78 
                        Uniform f32* %81 = OpAccessChain %17 %80 
                                 f32 %82 = OpLoad %81 
                                 f32 %83 = OpFAdd %79 %82 
                                             OpStore %70 %83 
                                 f32 %84 = OpLoad %70 
                                 f32 %85 = OpExtInst %1 13 %84 
                                             OpStore %70 %85 
                                 f32 %86 = OpLoad %70 
                               f32_2 %87 = OpCompositeConstruct %86 %86 
                               f32_2 %90 = OpFMul %87 %89 
                               f32_4 %91 = OpLoad %32 
                               f32_2 %92 = OpVectorShuffle %91 %91 0 2 
                               f32_2 %93 = OpFAdd %90 %92 
                               f32_4 %94 = OpLoad %32 
                               f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                             OpStore %32 %95 
                        Uniform f32* %96 = OpAccessChain %17 %80 
                                 f32 %97 = OpLoad %96 
                                 f32 %99 = OpFMul %97 %98 
                                             OpStore %70 %99 
                       Private f32* %100 = OpAccessChain %32 %73 
                                f32 %101 = OpLoad %100 
                                f32 %103 = OpFMul %101 %102 
                                f32 %104 = OpLoad %70 
                                f32 %105 = OpFAdd %103 %104 
                                             OpStore %70 %105 
                                f32 %106 = OpLoad %70 
                              f32_3 %107 = OpCompositeConstruct %106 %106 %106 
                              f32_3 %110 = OpFMul %107 %109 
                              f32_3 %115 = OpFAdd %110 %114 
                              f32_4 %116 = OpLoad %32 
                              f32_4 %117 = OpVectorShuffle %116 %115 4 1 5 6 
                                             OpStore %32 %117 
                              f32_4 %119 = OpLoad %32 
                              f32_3 %120 = OpVectorShuffle %119 %119 0 2 3 
                              f32_3 %123 = OpFMul %120 %122 
                                             OpStore %118 %123 
                              f32_3 %124 = OpLoad %118 
                              f32_3 %125 = OpExtInst %1 8 %124 
                                             OpStore %118 %125 
                              f32_3 %126 = OpLoad %118 
                              f32_3 %127 = OpFNegate %126 
                              f32_3 %128 = OpFMul %127 %109 
                              f32_4 %129 = OpLoad %32 
                              f32_3 %130 = OpVectorShuffle %129 %129 0 2 3 
                              f32_3 %131 = OpFAdd %128 %130 
                              f32_4 %132 = OpLoad %32 
                              f32_4 %133 = OpVectorShuffle %132 %131 4 1 5 6 
                                             OpStore %32 %133 
                              f32_4 %134 = OpLoad %32 
                              f32_3 %135 = OpVectorShuffle %134 %134 0 2 3 
                              f32_3 %138 = OpFAdd %135 %137 
                              f32_4 %139 = OpLoad %32 
                              f32_4 %140 = OpVectorShuffle %139 %138 4 1 5 6 
                                             OpStore %32 %140 
                              f32_4 %141 = OpLoad %32 
                              f32_3 %142 = OpVectorShuffle %141 %141 0 2 3 
                              f32_3 %143 = OpExtInst %1 4 %142 
                              f32_3 %146 = OpFAdd %143 %145 
                              f32_4 %147 = OpLoad %32 
                              f32_4 %148 = OpVectorShuffle %147 %146 4 1 5 6 
                                             OpStore %32 %148 
                              f32_4 %149 = OpLoad %32 
                              f32_3 %150 = OpVectorShuffle %149 %149 0 2 3 
                              f32_3 %152 = OpCompositeConstruct %111 %111 %111 
                              f32_3 %153 = OpCompositeConstruct %151 %151 %151 
                              f32_3 %154 = OpExtInst %1 43 %150 %152 %153 
                              f32_4 %155 = OpLoad %32 
                              f32_4 %156 = OpVectorShuffle %155 %154 4 1 5 6 
                                             OpStore %32 %156 
                       Private f32* %157 = OpAccessChain %32 %59 
                                f32 %158 = OpLoad %157 
                                f32 %159 = OpExtInst %1 4 %158 
                                f32 %160 = OpFNegate %159 
                                f32 %162 = OpFAdd %160 %161 
                                             OpStore %70 %162 
                       Private f32* %164 = OpAccessChain %32 %59 
                                f32 %165 = OpLoad %164 
                       Private f32* %166 = OpAccessChain %32 %59 
                                f32 %167 = OpLoad %166 
                                f32 %168 = OpFMul %165 %167 
                                             OpStore %163 %168 
                                f32 %169 = OpLoad %163 
                                f32 %171 = OpFMul %169 %170 
                                             OpStore %163 %171 
                                f32 %172 = OpLoad %163 
                                f32 %173 = OpExtInst %1 13 %172 
                                             OpStore %163 %173 
                                f32 %174 = OpLoad %163 
                                f32 %175 = OpFNegate %174 
                                f32 %177 = OpFMul %175 %176 
                                f32 %178 = OpFAdd %177 %151 
                                             OpStore %163 %178 
                                f32 %179 = OpLoad %70 
                                f32 %181 = OpFMul %179 %180 
                                             OpStore %70 %181 
                                f32 %182 = OpLoad %70 
                                f32 %183 = OpExtInst %1 43 %182 %111 %151 
                                             OpStore %70 %183 
                                f32 %184 = OpLoad %70 
                              f32_3 %185 = OpCompositeConstruct %184 %184 %184 
                              f32_4 %186 = OpLoad %32 
                              f32_3 %187 = OpVectorShuffle %186 %186 0 2 3 
                              f32_3 %188 = OpFMul %185 %187 
                              f32_4 %189 = OpLoad %32 
                              f32_4 %190 = OpVectorShuffle %189 %188 4 1 5 6 
                                             OpStore %32 %190 
                              f32_4 %193 = OpLoad %32 
                              f32_3 %194 = OpVectorShuffle %193 %193 0 2 3 
                                f32 %195 = OpLoad %163 
                              f32_3 %196 = OpCompositeConstruct %195 %195 %195 
                              f32_3 %197 = OpFMul %194 %196 
                              f32_3 %198 = OpLoad %9 
                              f32_3 %199 = OpFAdd %197 %198 
                              f32_4 %200 = OpLoad %192 
                              f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                             OpStore %192 %201 
                        Output f32* %204 = OpAccessChain %192 %202 
                                             OpStore %204 %151 
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