//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Pixelisation_Dot" {
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
  GpuProgramID 57907
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
vec2 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat1.xy = u_xlat6.xy * vec2(vec2(_Value, _Value));
    u_xlat0.xy = (-u_xlat6.xy) * vec2(vec2(_Value, _Value)) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = log2(abs(u_xlat0.xy));
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2.xyz = u_xlat1.xyz + vec3(-0.0, -1.0, -0.0);
    u_xlat1.xyz = u_xlat1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
    u_xlat6.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.666666687;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat9 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat9;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
    u_xlat6.x = exp2(u_xlat6.y);
    u_xlat0.xy = exp2(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlatb0 = u_xlat0.x<u_xlat6.x;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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
; Bound: 259
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %231 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpMemberDecorate %14 0 Offset 14 
                                             OpMemberDecorate %14 1 Offset 14 
                                             OpMemberDecorate %14 2 Offset 14 
                                             OpDecorate %14 Block 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %90 DescriptorSet 90 
                                             OpDecorate %90 Binding 90 
                                             OpDecorate %94 DescriptorSet 94 
                                             OpDecorate %94 Binding 94 
                                             OpDecorate %231 Location 231 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 2 
                                      %8 = OpTypePointer Private %7 
                       Private f32_2* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %13 = OpTypeVector %6 4 
                                     %14 = OpTypeStruct %6 %6 %13 
                                     %15 = OpTypePointer Uniform %14 
  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                     %17 = OpTypeInt 32 1 
                                 i32 %18 = OpConstant 2 
                                     %19 = OpTypePointer Uniform %13 
                      Private f32_2* %28 = OpVariable Private 
                                 i32 %30 = OpConstant 0 
                                     %31 = OpTypePointer Uniform %6 
                                     %43 = OpTypeVector %6 3 
                                     %44 = OpTypePointer Private %43 
                      Private f32_3* %45 = OpVariable Private 
                                 f32 %82 = OpConstant 3.674022E-40 
                               f32_2 %83 = OpConstantComposite %82 %82 
                                     %88 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %89 = OpTypePointer UniformConstant %88 
UniformConstant read_only Texture2D* %90 = OpVariable UniformConstant 
                                     %92 = OpTypeSampler 
                                     %93 = OpTypePointer UniformConstant %92 
            UniformConstant sampler* %94 = OpVariable UniformConstant 
                                     %96 = OpTypeSampledImage %88 
                     Private f32_3* %102 = OpVariable Private 
                                f32 %104 = OpConstant 3.674022E-40 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %104 %105 %104 
                                i32 %109 = OpConstant 1 
                                    %126 = OpTypeInt 32 0 
                                u32 %127 = OpConstant 0 
                                    %128 = OpTypePointer Private %6 
                                f32 %144 = OpConstant 3.674022E-40 
                                f32 %149 = OpConstant 3.674022E-40 
                       Private f32* %152 = OpVariable Private 
                                f32 %155 = OpConstant 3.674022E-40 
                                f32 %157 = OpConstant 3.674022E-40 
                                f32 %186 = OpConstant 3.674022E-40 
                                f32 %187 = OpConstant 3.674022E-40 
                                f32 %188 = OpConstant 3.674022E-40 
                              f32_3 %189 = OpConstantComposite %186 %187 %188 
                                f32 %201 = OpConstant 3.674022E-40 
                                f32 %202 = OpConstant 3.674022E-40 
                              f32_2 %203 = OpConstantComposite %201 %202 
                                u32 %209 = OpConstant 1 
                                    %222 = OpTypeBool 
                                    %223 = OpTypePointer Private %222 
                      Private bool* %224 = OpVariable Private 
                                    %230 = OpTypePointer Output %13 
                      Output f32_4* %231 = OpVariable Output 
                                    %233 = OpTypePointer Function %43 
                                u32 %255 = OpConstant 3 
                                    %256 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                    Function f32_3* %234 = OpVariable Function 
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
                               f32_2 %29 = OpLoad %9 
                        Uniform f32* %32 = OpAccessChain %16 %30 
                                 f32 %33 = OpLoad %32 
                        Uniform f32* %34 = OpAccessChain %16 %30 
                                 f32 %35 = OpLoad %34 
                               f32_2 %36 = OpCompositeConstruct %33 %35 
                                 f32 %37 = OpCompositeExtract %36 0 
                                 f32 %38 = OpCompositeExtract %36 1 
                               f32_2 %39 = OpCompositeConstruct %37 %38 
                               f32_2 %40 = OpFDiv %29 %39 
                                             OpStore %28 %40 
                               f32_2 %41 = OpLoad %28 
                               f32_2 %42 = OpExtInst %1 8 %41 
                                             OpStore %28 %42 
                               f32_2 %46 = OpLoad %28 
                        Uniform f32* %47 = OpAccessChain %16 %30 
                                 f32 %48 = OpLoad %47 
                        Uniform f32* %49 = OpAccessChain %16 %30 
                                 f32 %50 = OpLoad %49 
                               f32_2 %51 = OpCompositeConstruct %48 %50 
                                 f32 %52 = OpCompositeExtract %51 0 
                                 f32 %53 = OpCompositeExtract %51 1 
                               f32_2 %54 = OpCompositeConstruct %52 %53 
                               f32_2 %55 = OpFMul %46 %54 
                               f32_3 %56 = OpLoad %45 
                               f32_3 %57 = OpVectorShuffle %56 %55 3 4 2 
                                             OpStore %45 %57 
                               f32_2 %58 = OpLoad %28 
                               f32_2 %59 = OpFNegate %58 
                        Uniform f32* %60 = OpAccessChain %16 %30 
                                 f32 %61 = OpLoad %60 
                        Uniform f32* %62 = OpAccessChain %16 %30 
                                 f32 %63 = OpLoad %62 
                               f32_2 %64 = OpCompositeConstruct %61 %63 
                                 f32 %65 = OpCompositeExtract %64 0 
                                 f32 %66 = OpCompositeExtract %64 1 
                               f32_2 %67 = OpCompositeConstruct %65 %66 
                               f32_2 %68 = OpFMul %59 %67 
                               f32_2 %69 = OpLoad %9 
                               f32_2 %70 = OpFAdd %68 %69 
                                             OpStore %9 %70 
                               f32_2 %71 = OpLoad %9 
                        Uniform f32* %72 = OpAccessChain %16 %30 
                                 f32 %73 = OpLoad %72 
                        Uniform f32* %74 = OpAccessChain %16 %30 
                                 f32 %75 = OpLoad %74 
                               f32_2 %76 = OpCompositeConstruct %73 %75 
                                 f32 %77 = OpCompositeExtract %76 0 
                                 f32 %78 = OpCompositeExtract %76 1 
                               f32_2 %79 = OpCompositeConstruct %77 %78 
                               f32_2 %80 = OpFDiv %71 %79 
                                             OpStore %9 %80 
                               f32_2 %81 = OpLoad %9 
                               f32_2 %84 = OpFAdd %81 %83 
                                             OpStore %9 %84 
                               f32_2 %85 = OpLoad %9 
                               f32_2 %86 = OpExtInst %1 4 %85 
                               f32_2 %87 = OpExtInst %1 30 %86 
                                             OpStore %9 %87 
                 read_only Texture2D %91 = OpLoad %90 
                             sampler %95 = OpLoad %94 
          read_only Texture2DSampled %97 = OpSampledImage %91 %95 
                               f32_3 %98 = OpLoad %45 
                               f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                              f32_4 %100 = OpImageSampleImplicitLod %97 %99 
                              f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                             OpStore %45 %101 
                              f32_3 %103 = OpLoad %45 
                              f32_3 %107 = OpFAdd %103 %106 
                                             OpStore %102 %107 
                              f32_3 %108 = OpLoad %45 
                       Uniform f32* %110 = OpAccessChain %16 %109 
                                f32 %111 = OpLoad %110 
                       Uniform f32* %112 = OpAccessChain %16 %109 
                                f32 %113 = OpLoad %112 
                       Uniform f32* %114 = OpAccessChain %16 %109 
                                f32 %115 = OpLoad %114 
                              f32_3 %116 = OpCompositeConstruct %111 %113 %115 
                                f32 %117 = OpCompositeExtract %116 0 
                                f32 %118 = OpCompositeExtract %116 1 
                                f32 %119 = OpCompositeExtract %116 2 
                              f32_3 %120 = OpCompositeConstruct %117 %118 %119 
                              f32_3 %121 = OpFNegate %120 
                              f32_3 %122 = OpFAdd %108 %121 
                                             OpStore %45 %122 
                              f32_3 %123 = OpLoad %102 
                              f32_3 %124 = OpLoad %102 
                                f32 %125 = OpDot %123 %124 
                       Private f32* %129 = OpAccessChain %28 %127 
                                             OpStore %129 %125 
                       Private f32* %130 = OpAccessChain %28 %127 
                                f32 %131 = OpLoad %130 
                       Private f32* %132 = OpAccessChain %28 %127 
                                f32 %133 = OpLoad %132 
                                f32 %134 = OpFMul %131 %133 
                       Private f32* %135 = OpAccessChain %28 %127 
                                             OpStore %135 %134 
                       Private f32* %136 = OpAccessChain %28 %127 
                                f32 %137 = OpLoad %136 
                       Private f32* %138 = OpAccessChain %28 %127 
                                f32 %139 = OpLoad %138 
                                f32 %140 = OpFMul %137 %139 
                       Private f32* %141 = OpAccessChain %28 %127 
                                             OpStore %141 %140 
                       Private f32* %142 = OpAccessChain %28 %127 
                                f32 %143 = OpLoad %142 
                                f32 %145 = OpFMul %143 %144 
                       Private f32* %146 = OpAccessChain %28 %127 
                                             OpStore %146 %145 
                       Private f32* %147 = OpAccessChain %28 %127 
                                f32 %148 = OpLoad %147 
                                f32 %150 = OpExtInst %1 37 %148 %149 
                       Private f32* %151 = OpAccessChain %28 %127 
                                             OpStore %151 %150 
                       Private f32* %153 = OpAccessChain %28 %127 
                                f32 %154 = OpLoad %153 
                                f32 %156 = OpFMul %154 %155 
                                f32 %158 = OpFAdd %156 %157 
                                             OpStore %152 %158 
                       Private f32* %159 = OpAccessChain %28 %127 
                                f32 %160 = OpLoad %159 
                       Private f32* %161 = OpAccessChain %28 %127 
                                f32 %162 = OpLoad %161 
                                f32 %163 = OpFMul %160 %162 
                       Private f32* %164 = OpAccessChain %28 %127 
                                             OpStore %164 %163 
                       Private f32* %165 = OpAccessChain %28 %127 
                                f32 %166 = OpLoad %165 
                                f32 %167 = OpLoad %152 
                                f32 %168 = OpFMul %166 %167 
                       Private f32* %169 = OpAccessChain %28 %127 
                                             OpStore %169 %168 
                              f32_2 %170 = OpLoad %28 
                              f32_3 %171 = OpVectorShuffle %170 %170 0 0 0 
                              f32_3 %172 = OpLoad %45 
                              f32_3 %173 = OpFMul %171 %172 
                       Uniform f32* %174 = OpAccessChain %16 %109 
                                f32 %175 = OpLoad %174 
                       Uniform f32* %176 = OpAccessChain %16 %109 
                                f32 %177 = OpLoad %176 
                       Uniform f32* %178 = OpAccessChain %16 %109 
                                f32 %179 = OpLoad %178 
                              f32_3 %180 = OpCompositeConstruct %175 %177 %179 
                                f32 %181 = OpCompositeExtract %180 0 
                                f32 %182 = OpCompositeExtract %180 1 
                                f32 %183 = OpCompositeExtract %180 2 
                              f32_3 %184 = OpCompositeConstruct %181 %182 %183 
                              f32_3 %185 = OpFAdd %173 %184 
                                             OpStore %45 %185 
                              f32_3 %190 = OpLoad %45 
                                f32 %191 = OpDot %189 %190 
                       Private f32* %192 = OpAccessChain %28 %127 
                                             OpStore %192 %191 
                       Private f32* %193 = OpAccessChain %28 %127 
                                f32 %194 = OpLoad %193 
                       Private f32* %195 = OpAccessChain %28 %127 
                                f32 %196 = OpLoad %195 
                                f32 %197 = OpFMul %194 %196 
                       Private f32* %198 = OpAccessChain %28 %127 
                                             OpStore %198 %197 
                              f32_2 %199 = OpLoad %28 
                              f32_2 %200 = OpVectorShuffle %199 %199 0 0 
                              f32_2 %204 = OpFMul %200 %203 
                                             OpStore %28 %204 
                              f32_2 %205 = OpLoad %9 
                              f32_2 %206 = OpLoad %28 
                              f32_2 %207 = OpVectorShuffle %206 %206 0 0 
                              f32_2 %208 = OpFMul %205 %207 
                                             OpStore %9 %208 
                       Private f32* %210 = OpAccessChain %28 %209 
                                f32 %211 = OpLoad %210 
                                f32 %212 = OpExtInst %1 29 %211 
                       Private f32* %213 = OpAccessChain %28 %127 
                                             OpStore %213 %212 
                              f32_2 %214 = OpLoad %9 
                              f32_2 %215 = OpExtInst %1 29 %214 
                                             OpStore %9 %215 
                       Private f32* %216 = OpAccessChain %9 %209 
                                f32 %217 = OpLoad %216 
                       Private f32* %218 = OpAccessChain %9 %127 
                                f32 %219 = OpLoad %218 
                                f32 %220 = OpFAdd %217 %219 
                       Private f32* %221 = OpAccessChain %9 %127 
                                             OpStore %221 %220 
                       Private f32* %225 = OpAccessChain %9 %127 
                                f32 %226 = OpLoad %225 
                       Private f32* %227 = OpAccessChain %28 %127 
                                f32 %228 = OpLoad %227 
                               bool %229 = OpFOrdLessThan %226 %228 
                                             OpStore %224 %229 
                               bool %232 = OpLoad %224 
                                             OpSelectionMerge %236 None 
                                             OpBranchConditional %232 %235 %238 
                                    %235 = OpLabel 
                              f32_3 %237 = OpLoad %45 
                                             OpStore %234 %237 
                                             OpBranch %236 
                                    %238 = OpLabel 
                       Uniform f32* %239 = OpAccessChain %16 %109 
                                f32 %240 = OpLoad %239 
                       Uniform f32* %241 = OpAccessChain %16 %109 
                                f32 %242 = OpLoad %241 
                       Uniform f32* %243 = OpAccessChain %16 %109 
                                f32 %244 = OpLoad %243 
                       Uniform f32* %245 = OpAccessChain %16 %109 
                                f32 %246 = OpLoad %245 
                              f32_4 %247 = OpCompositeConstruct %240 %242 %244 %246 
                                f32 %248 = OpCompositeExtract %247 0 
                                f32 %249 = OpCompositeExtract %247 1 
                                f32 %250 = OpCompositeExtract %247 2 
                              f32_3 %251 = OpCompositeConstruct %248 %249 %250 
                                             OpStore %234 %251 
                                             OpBranch %236 
                                    %236 = OpLabel 
                              f32_3 %252 = OpLoad %234 
                              f32_4 %253 = OpLoad %231 
                              f32_4 %254 = OpVectorShuffle %253 %252 4 5 6 3 
                                             OpStore %231 %254 
                        Output f32* %257 = OpAccessChain %231 %255 
                                             OpStore %257 %149 
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