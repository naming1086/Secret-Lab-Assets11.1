//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/BlurTiltShift_V" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_MainTex2 ("Blurred (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Amount ("_Amount", Range(0, 20)) = 5
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 32028
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
uniform 	vec4 _ScreenParams;
uniform 	float _Amount;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3 = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
    u_xlat3 = _Amount / _ScreenParams.x;
    u_xlat0.y = u_xlat0.x * u_xlat3;
    u_xlat0.x = 0.0;
    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat6.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
; Bound: 164
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %153 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %28 0 Offset 28 
                                                     OpMemberDecorate %28 1 Offset 28 
                                                     OpMemberDecorate %28 2 Offset 28 
                                                     OpMemberDecorate %28 3 Offset 28 
                                                     OpMemberDecorate %28 4 Offset 28 
                                                     OpDecorate %28 Block 
                                                     OpDecorate %30 DescriptorSet 30 
                                                     OpDecorate %30 Binding 30 
                                                     OpDecorate %121 DescriptorSet 121 
                                                     OpDecorate %121 Binding 121 
                                                     OpDecorate %125 DescriptorSet 125 
                                                     OpDecorate %125 Binding 125 
                                                     OpDecorate %153 Location 153 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 1 
                                             %15 = OpTypePointer Input %6 
                                         f32 %19 = OpConstant 3.674022E-40 
                                         u32 %21 = OpConstant 0 
                                             %22 = OpTypePointer Private %6 
                                             %27 = OpTypeVector %6 4 
                                             %28 = OpTypeStruct %27 %6 %6 %6 %6 
                                             %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
                                             %31 = OpTypeInt 32 1 
                                         i32 %32 = OpConstant 4 
                                             %33 = OpTypePointer Uniform %6 
                                         i32 %50 = OpConstant 3 
                                Private f32* %56 = OpVariable Private 
                                         f32 %57 = OpConstant 3.674022E-40 
                                         i32 %58 = OpConstant 2 
                                         f32 %70 = OpConstant 3.674022E-40 
                                         f32 %75 = OpConstant 3.674022E-40 
                                         f32 %77 = OpConstant 3.674022E-40 
                                         i32 %92 = OpConstant 1 
                                         i32 %95 = OpConstant 0 
                                            %105 = OpTypePointer Private %10 
                             Private f32_2* %106 = OpVariable Private 
                             Private f32_3* %118 = OpVariable Private 
                                            %119 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %120 = OpTypePointer UniformConstant %119 
       UniformConstant read_only Texture2D* %121 = OpVariable UniformConstant 
                                            %123 = OpTypeSampler 
                                            %124 = OpTypePointer UniformConstant %123 
                   UniformConstant sampler* %125 = OpVariable UniformConstant 
                                            %127 = OpTypeSampledImage %119 
                             Private f32_3* %139 = OpVariable Private 
                                            %152 = OpTypePointer Output %27 
                              Output f32_4* %153 = OpVariable Output 
                                        f32 %155 = OpConstant 3.674022E-40 
                                      f32_3 %156 = OpConstantComposite %155 %155 %155 
                                        u32 %160 = OpConstant 3 
                                            %161 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                  Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %17 = OpLoad %16 
                                         f32 %18 = OpFNegate %17 
                                         f32 %20 = OpFAdd %18 %19 
                                Private f32* %23 = OpAccessChain %9 %21 
                                                     OpStore %23 %20 
                                  Input f32* %24 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %25 = OpLoad %24 
                                         f32 %26 = OpFNegate %25 
                                Uniform f32* %34 = OpAccessChain %30 %32 
                                         f32 %35 = OpLoad %34 
                                         f32 %36 = OpFAdd %26 %35 
                                Private f32* %37 = OpAccessChain %9 %14 
                                                     OpStore %37 %36 
                                       f32_3 %38 = OpLoad %9 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_3 %40 = OpLoad %9 
                                       f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                         f32 %42 = OpDot %39 %41 
                                Private f32* %43 = OpAccessChain %9 %21 
                                                     OpStore %43 %42 
                                Private f32* %44 = OpAccessChain %9 %21 
                                         f32 %45 = OpLoad %44 
                                         f32 %46 = OpExtInst %1 31 %45 
                                Private f32* %47 = OpAccessChain %9 %21 
                                                     OpStore %47 %46 
                                Private f32* %48 = OpAccessChain %9 %21 
                                         f32 %49 = OpLoad %48 
                                Uniform f32* %51 = OpAccessChain %30 %50 
                                         f32 %52 = OpLoad %51 
                                         f32 %53 = OpFNegate %52 
                                         f32 %54 = OpFAdd %49 %53 
                                Private f32* %55 = OpAccessChain %9 %21 
                                                     OpStore %55 %54 
                                Uniform f32* %59 = OpAccessChain %30 %58 
                                         f32 %60 = OpLoad %59 
                                         f32 %61 = OpFNegate %60 
                                         f32 %62 = OpFDiv %57 %61 
                                                     OpStore %56 %62 
                                         f32 %63 = OpLoad %56 
                                Private f32* %64 = OpAccessChain %9 %21 
                                         f32 %65 = OpLoad %64 
                                         f32 %66 = OpFMul %63 %65 
                                Private f32* %67 = OpAccessChain %9 %21 
                                                     OpStore %67 %66 
                                Private f32* %68 = OpAccessChain %9 %21 
                                         f32 %69 = OpLoad %68 
                                         f32 %71 = OpExtInst %1 43 %69 %70 %57 
                                Private f32* %72 = OpAccessChain %9 %21 
                                                     OpStore %72 %71 
                                Private f32* %73 = OpAccessChain %9 %21 
                                         f32 %74 = OpLoad %73 
                                         f32 %76 = OpFMul %74 %75 
                                         f32 %78 = OpFAdd %76 %77 
                                                     OpStore %56 %78 
                                Private f32* %79 = OpAccessChain %9 %21 
                                         f32 %80 = OpLoad %79 
                                Private f32* %81 = OpAccessChain %9 %21 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %80 %82 
                                Private f32* %84 = OpAccessChain %9 %21 
                                                     OpStore %84 %83 
                                         f32 %85 = OpLoad %56 
                                         f32 %86 = OpFNegate %85 
                                Private f32* %87 = OpAccessChain %9 %21 
                                         f32 %88 = OpLoad %87 
                                         f32 %89 = OpFMul %86 %88 
                                         f32 %90 = OpFAdd %89 %57 
                                Private f32* %91 = OpAccessChain %9 %21 
                                                     OpStore %91 %90 
                                Uniform f32* %93 = OpAccessChain %30 %92 
                                         f32 %94 = OpLoad %93 
                                Uniform f32* %96 = OpAccessChain %30 %95 %21 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFDiv %94 %97 
                                                     OpStore %56 %98 
                                Private f32* %99 = OpAccessChain %9 %21 
                                        f32 %100 = OpLoad %99 
                                        f32 %101 = OpLoad %56 
                                        f32 %102 = OpFMul %100 %101 
                               Private f32* %103 = OpAccessChain %9 %14 
                                                     OpStore %103 %102 
                               Private f32* %104 = OpAccessChain %9 %21 
                                                     OpStore %104 %70 
                                      f32_3 %107 = OpLoad %9 
                                      f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                      f32_2 %109 = OpFNegate %108 
                                      f32_2 %110 = OpLoad vs_TEXCOORD0 
                                      f32_2 %111 = OpFAdd %109 %110 
                                                     OpStore %106 %111 
                                      f32_3 %112 = OpLoad %9 
                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                      f32_2 %114 = OpLoad vs_TEXCOORD0 
                                      f32_2 %115 = OpFAdd %113 %114 
                                      f32_3 %116 = OpLoad %9 
                                      f32_3 %117 = OpVectorShuffle %116 %115 3 4 2 
                                                     OpStore %9 %117 
                        read_only Texture2D %122 = OpLoad %121 
                                    sampler %126 = OpLoad %125 
                 read_only Texture2DSampled %128 = OpSampledImage %122 %126 
                                      f32_3 %129 = OpLoad %9 
                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                      f32_4 %131 = OpImageSampleImplicitLod %128 %130 
                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                                     OpStore %118 %132 
                        read_only Texture2D %133 = OpLoad %121 
                                    sampler %134 = OpLoad %125 
                 read_only Texture2DSampled %135 = OpSampledImage %133 %134 
                                      f32_2 %136 = OpLoad %106 
                                      f32_4 %137 = OpImageSampleImplicitLod %135 %136 
                                      f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                                     OpStore %9 %138 
                        read_only Texture2D %140 = OpLoad %121 
                                    sampler %141 = OpLoad %125 
                 read_only Texture2DSampled %142 = OpSampledImage %140 %141 
                                      f32_2 %143 = OpLoad vs_TEXCOORD0 
                                      f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                      f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                                     OpStore %139 %145 
                                      f32_3 %146 = OpLoad %9 
                                      f32_3 %147 = OpLoad %139 
                                      f32_3 %148 = OpFAdd %146 %147 
                                                     OpStore %9 %148 
                                      f32_3 %149 = OpLoad %118 
                                      f32_3 %150 = OpLoad %9 
                                      f32_3 %151 = OpFAdd %149 %150 
                                                     OpStore %9 %151 
                                      f32_3 %154 = OpLoad %9 
                                      f32_3 %157 = OpFMul %154 %156 
                                      f32_4 %158 = OpLoad %153 
                                      f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                     OpStore %153 %159 
                                Output f32* %162 = OpAccessChain %153 %160 
                                                     OpStore %162 %57 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 82307
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
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3.x = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = texture(_MainTex2, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
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
; Bound: 133
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %120 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %26 0 Offset 26 
                                              OpMemberDecorate %26 1 Offset 26 
                                              OpMemberDecorate %26 2 Offset 26 
                                              OpDecorate %26 Block 
                                              OpDecorate %28 DescriptorSet 28 
                                              OpDecorate %28 Binding 28 
                                              OpDecorate %94 DescriptorSet 94 
                                              OpDecorate %94 Binding 94 
                                              OpDecorate %98 DescriptorSet 98 
                                              OpDecorate %98 Binding 98 
                                              OpDecorate %107 DescriptorSet 107 
                                              OpDecorate %107 Binding 107 
                                              OpDecorate %109 DescriptorSet 109 
                                              OpDecorate %109 Binding 109 
                                              OpDecorate %120 Location 120 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %12 = OpTypeInt 32 0 
                                  u32 %13 = OpConstant 1 
                                      %14 = OpTypePointer Input %6 
                                  f32 %18 = OpConstant 3.674022E-40 
                                  u32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Private %6 
                                      %26 = OpTypeStruct %6 %6 %6 
                                      %27 = OpTypePointer Uniform %26 
     Uniform struct {f32; f32; f32;}* %28 = OpVariable Uniform 
                                      %29 = OpTypeInt 32 1 
                                  i32 %30 = OpConstant 2 
                                      %31 = OpTypePointer Uniform %6 
                                  i32 %46 = OpConstant 1 
                                      %52 = OpTypeVector %6 3 
                                      %53 = OpTypePointer Private %52 
                       Private f32_3* %54 = OpVariable Private 
                                  f32 %55 = OpConstant 3.674022E-40 
                                  i32 %56 = OpConstant 0 
                                  f32 %70 = OpConstant 3.674022E-40 
                                  f32 %75 = OpConstant 3.674022E-40 
                                  f32 %77 = OpConstant 3.674022E-40 
                                      %92 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %93 = OpTypePointer UniformConstant %92 
 UniformConstant read_only Texture2D* %94 = OpVariable UniformConstant 
                                      %96 = OpTypeSampler 
                                      %97 = OpTypePointer UniformConstant %96 
             UniformConstant sampler* %98 = OpVariable UniformConstant 
                                     %100 = OpTypeSampledImage %92 
                                     %103 = OpTypeVector %6 4 
                      Private f32_3* %106 = OpVariable Private 
UniformConstant read_only Texture2D* %107 = OpVariable UniformConstant 
            UniformConstant sampler* %109 = OpVariable UniformConstant 
                                     %119 = OpTypePointer Output %103 
                       Output f32_4* %120 = OpVariable Output 
                                 u32 %129 = OpConstant 3 
                                     %130 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                  f32 %16 = OpLoad %15 
                                  f32 %17 = OpFNegate %16 
                                  f32 %19 = OpFAdd %17 %18 
                         Private f32* %22 = OpAccessChain %9 %20 
                                              OpStore %22 %19 
                           Input f32* %23 = OpAccessChain vs_TEXCOORD0 %13 
                                  f32 %24 = OpLoad %23 
                                  f32 %25 = OpFNegate %24 
                         Uniform f32* %32 = OpAccessChain %28 %30 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpFAdd %25 %33 
                         Private f32* %35 = OpAccessChain %9 %13 
                                              OpStore %35 %34 
                                f32_2 %36 = OpLoad %9 
                                f32_2 %37 = OpLoad %9 
                                  f32 %38 = OpDot %36 %37 
                         Private f32* %39 = OpAccessChain %9 %20 
                                              OpStore %39 %38 
                         Private f32* %40 = OpAccessChain %9 %20 
                                  f32 %41 = OpLoad %40 
                                  f32 %42 = OpExtInst %1 31 %41 
                         Private f32* %43 = OpAccessChain %9 %20 
                                              OpStore %43 %42 
                         Private f32* %44 = OpAccessChain %9 %20 
                                  f32 %45 = OpLoad %44 
                         Uniform f32* %47 = OpAccessChain %28 %46 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFNegate %48 
                                  f32 %50 = OpFAdd %45 %49 
                         Private f32* %51 = OpAccessChain %9 %20 
                                              OpStore %51 %50 
                         Uniform f32* %57 = OpAccessChain %28 %56 
                                  f32 %58 = OpLoad %57 
                                  f32 %59 = OpFNegate %58 
                                  f32 %60 = OpFDiv %55 %59 
                         Private f32* %61 = OpAccessChain %54 %20 
                                              OpStore %61 %60 
                         Private f32* %62 = OpAccessChain %54 %20 
                                  f32 %63 = OpLoad %62 
                         Private f32* %64 = OpAccessChain %9 %20 
                                  f32 %65 = OpLoad %64 
                                  f32 %66 = OpFMul %63 %65 
                         Private f32* %67 = OpAccessChain %9 %20 
                                              OpStore %67 %66 
                         Private f32* %68 = OpAccessChain %9 %20 
                                  f32 %69 = OpLoad %68 
                                  f32 %71 = OpExtInst %1 43 %69 %70 %55 
                         Private f32* %72 = OpAccessChain %9 %20 
                                              OpStore %72 %71 
                         Private f32* %73 = OpAccessChain %9 %20 
                                  f32 %74 = OpLoad %73 
                                  f32 %76 = OpFMul %74 %75 
                                  f32 %78 = OpFAdd %76 %77 
                         Private f32* %79 = OpAccessChain %54 %20 
                                              OpStore %79 %78 
                         Private f32* %80 = OpAccessChain %9 %20 
                                  f32 %81 = OpLoad %80 
                         Private f32* %82 = OpAccessChain %9 %20 
                                  f32 %83 = OpLoad %82 
                                  f32 %84 = OpFMul %81 %83 
                         Private f32* %85 = OpAccessChain %9 %20 
                                              OpStore %85 %84 
                         Private f32* %86 = OpAccessChain %9 %20 
                                  f32 %87 = OpLoad %86 
                         Private f32* %88 = OpAccessChain %54 %20 
                                  f32 %89 = OpLoad %88 
                                  f32 %90 = OpFMul %87 %89 
                         Private f32* %91 = OpAccessChain %9 %20 
                                              OpStore %91 %90 
                  read_only Texture2D %95 = OpLoad %94 
                              sampler %99 = OpLoad %98 
          read_only Texture2DSampled %101 = OpSampledImage %95 %99 
                               f32_2 %102 = OpLoad vs_TEXCOORD0 
                               f32_4 %104 = OpImageSampleImplicitLod %101 %102 
                               f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                              OpStore %54 %105 
                 read_only Texture2D %108 = OpLoad %107 
                             sampler %110 = OpLoad %109 
          read_only Texture2DSampled %111 = OpSampledImage %108 %110 
                               f32_2 %112 = OpLoad vs_TEXCOORD0 
                               f32_4 %113 = OpImageSampleImplicitLod %111 %112 
                               f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                              OpStore %106 %114 
                               f32_3 %115 = OpLoad %54 
                               f32_3 %116 = OpLoad %106 
                               f32_3 %117 = OpFNegate %116 
                               f32_3 %118 = OpFAdd %115 %117 
                                              OpStore %54 %118 
                               f32_2 %121 = OpLoad %9 
                               f32_3 %122 = OpVectorShuffle %121 %121 0 0 0 
                               f32_3 %123 = OpLoad %54 
                               f32_3 %124 = OpFMul %122 %123 
                               f32_3 %125 = OpLoad %106 
                               f32_3 %126 = OpFAdd %124 %125 
                               f32_4 %127 = OpLoad %120 
                               f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                              OpStore %120 %128 
                         Output f32* %131 = OpAccessChain %120 %129 
                                              OpStore %131 %55 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 167317
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
uniform 	vec4 _ScreenParams;
uniform 	float _Amount;
uniform 	float _Value1;
uniform 	float _Value2;
uniform 	float _Value3;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value2);
    u_xlat3 = float(1.0) / (-_Value1);
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
    u_xlat3 = _Amount / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.y = 0.0;
    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat6.xy);
    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
; Bound: 164
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %153 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %28 0 Offset 28 
                                                     OpMemberDecorate %28 1 Offset 28 
                                                     OpMemberDecorate %28 2 Offset 28 
                                                     OpMemberDecorate %28 3 Offset 28 
                                                     OpMemberDecorate %28 4 Offset 28 
                                                     OpDecorate %28 Block 
                                                     OpDecorate %30 DescriptorSet 30 
                                                     OpDecorate %30 Binding 30 
                                                     OpDecorate %121 DescriptorSet 121 
                                                     OpDecorate %121 Binding 121 
                                                     OpDecorate %125 DescriptorSet 125 
                                                     OpDecorate %125 Binding 125 
                                                     OpDecorate %153 Location 153 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 1 
                                             %15 = OpTypePointer Input %6 
                                         f32 %19 = OpConstant 3.674022E-40 
                                         u32 %21 = OpConstant 0 
                                             %22 = OpTypePointer Private %6 
                                             %27 = OpTypeVector %6 4 
                                             %28 = OpTypeStruct %27 %6 %6 %6 %6 
                                             %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
                                             %31 = OpTypeInt 32 1 
                                         i32 %32 = OpConstant 4 
                                             %33 = OpTypePointer Uniform %6 
                                         i32 %50 = OpConstant 3 
                                Private f32* %56 = OpVariable Private 
                                         f32 %57 = OpConstant 3.674022E-40 
                                         i32 %58 = OpConstant 2 
                                         f32 %70 = OpConstant 3.674022E-40 
                                         f32 %75 = OpConstant 3.674022E-40 
                                         f32 %77 = OpConstant 3.674022E-40 
                                         i32 %92 = OpConstant 1 
                                         i32 %95 = OpConstant 0 
                                            %105 = OpTypePointer Private %10 
                             Private f32_2* %106 = OpVariable Private 
                             Private f32_3* %118 = OpVariable Private 
                                            %119 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %120 = OpTypePointer UniformConstant %119 
       UniformConstant read_only Texture2D* %121 = OpVariable UniformConstant 
                                            %123 = OpTypeSampler 
                                            %124 = OpTypePointer UniformConstant %123 
                   UniformConstant sampler* %125 = OpVariable UniformConstant 
                                            %127 = OpTypeSampledImage %119 
                             Private f32_3* %139 = OpVariable Private 
                                            %152 = OpTypePointer Output %27 
                              Output f32_4* %153 = OpVariable Output 
                                        f32 %155 = OpConstant 3.674022E-40 
                                      f32_3 %156 = OpConstantComposite %155 %155 %155 
                                        u32 %160 = OpConstant 3 
                                            %161 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                  Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %17 = OpLoad %16 
                                         f32 %18 = OpFNegate %17 
                                         f32 %20 = OpFAdd %18 %19 
                                Private f32* %23 = OpAccessChain %9 %21 
                                                     OpStore %23 %20 
                                  Input f32* %24 = OpAccessChain vs_TEXCOORD0 %14 
                                         f32 %25 = OpLoad %24 
                                         f32 %26 = OpFNegate %25 
                                Uniform f32* %34 = OpAccessChain %30 %32 
                                         f32 %35 = OpLoad %34 
                                         f32 %36 = OpFAdd %26 %35 
                                Private f32* %37 = OpAccessChain %9 %14 
                                                     OpStore %37 %36 
                                       f32_3 %38 = OpLoad %9 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_3 %40 = OpLoad %9 
                                       f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                         f32 %42 = OpDot %39 %41 
                                Private f32* %43 = OpAccessChain %9 %21 
                                                     OpStore %43 %42 
                                Private f32* %44 = OpAccessChain %9 %21 
                                         f32 %45 = OpLoad %44 
                                         f32 %46 = OpExtInst %1 31 %45 
                                Private f32* %47 = OpAccessChain %9 %21 
                                                     OpStore %47 %46 
                                Private f32* %48 = OpAccessChain %9 %21 
                                         f32 %49 = OpLoad %48 
                                Uniform f32* %51 = OpAccessChain %30 %50 
                                         f32 %52 = OpLoad %51 
                                         f32 %53 = OpFNegate %52 
                                         f32 %54 = OpFAdd %49 %53 
                                Private f32* %55 = OpAccessChain %9 %21 
                                                     OpStore %55 %54 
                                Uniform f32* %59 = OpAccessChain %30 %58 
                                         f32 %60 = OpLoad %59 
                                         f32 %61 = OpFNegate %60 
                                         f32 %62 = OpFDiv %57 %61 
                                                     OpStore %56 %62 
                                         f32 %63 = OpLoad %56 
                                Private f32* %64 = OpAccessChain %9 %21 
                                         f32 %65 = OpLoad %64 
                                         f32 %66 = OpFMul %63 %65 
                                Private f32* %67 = OpAccessChain %9 %21 
                                                     OpStore %67 %66 
                                Private f32* %68 = OpAccessChain %9 %21 
                                         f32 %69 = OpLoad %68 
                                         f32 %71 = OpExtInst %1 43 %69 %70 %57 
                                Private f32* %72 = OpAccessChain %9 %21 
                                                     OpStore %72 %71 
                                Private f32* %73 = OpAccessChain %9 %21 
                                         f32 %74 = OpLoad %73 
                                         f32 %76 = OpFMul %74 %75 
                                         f32 %78 = OpFAdd %76 %77 
                                                     OpStore %56 %78 
                                Private f32* %79 = OpAccessChain %9 %21 
                                         f32 %80 = OpLoad %79 
                                Private f32* %81 = OpAccessChain %9 %21 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %80 %82 
                                Private f32* %84 = OpAccessChain %9 %21 
                                                     OpStore %84 %83 
                                         f32 %85 = OpLoad %56 
                                         f32 %86 = OpFNegate %85 
                                Private f32* %87 = OpAccessChain %9 %21 
                                         f32 %88 = OpLoad %87 
                                         f32 %89 = OpFMul %86 %88 
                                         f32 %90 = OpFAdd %89 %57 
                                Private f32* %91 = OpAccessChain %9 %21 
                                                     OpStore %91 %90 
                                Uniform f32* %93 = OpAccessChain %30 %92 
                                         f32 %94 = OpLoad %93 
                                Uniform f32* %96 = OpAccessChain %30 %95 %14 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFDiv %94 %97 
                                                     OpStore %56 %98 
                                Private f32* %99 = OpAccessChain %9 %21 
                                        f32 %100 = OpLoad %99 
                                        f32 %101 = OpLoad %56 
                                        f32 %102 = OpFMul %100 %101 
                               Private f32* %103 = OpAccessChain %9 %21 
                                                     OpStore %103 %102 
                               Private f32* %104 = OpAccessChain %9 %14 
                                                     OpStore %104 %70 
                                      f32_3 %107 = OpLoad %9 
                                      f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                      f32_2 %109 = OpFNegate %108 
                                      f32_2 %110 = OpLoad vs_TEXCOORD0 
                                      f32_2 %111 = OpFAdd %109 %110 
                                                     OpStore %106 %111 
                                      f32_3 %112 = OpLoad %9 
                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                      f32_2 %114 = OpLoad vs_TEXCOORD0 
                                      f32_2 %115 = OpFAdd %113 %114 
                                      f32_3 %116 = OpLoad %9 
                                      f32_3 %117 = OpVectorShuffle %116 %115 3 4 2 
                                                     OpStore %9 %117 
                        read_only Texture2D %122 = OpLoad %121 
                                    sampler %126 = OpLoad %125 
                 read_only Texture2DSampled %128 = OpSampledImage %122 %126 
                                      f32_3 %129 = OpLoad %9 
                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                      f32_4 %131 = OpImageSampleImplicitLod %128 %130 
                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                                     OpStore %118 %132 
                        read_only Texture2D %133 = OpLoad %121 
                                    sampler %134 = OpLoad %125 
                 read_only Texture2DSampled %135 = OpSampledImage %133 %134 
                                      f32_2 %136 = OpLoad %106 
                                      f32_4 %137 = OpImageSampleImplicitLod %135 %136 
                                      f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                                     OpStore %9 %138 
                        read_only Texture2D %140 = OpLoad %121 
                                    sampler %141 = OpLoad %125 
                 read_only Texture2DSampled %142 = OpSampledImage %140 %141 
                                      f32_2 %143 = OpLoad vs_TEXCOORD0 
                                      f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                      f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                                     OpStore %139 %145 
                                      f32_3 %146 = OpLoad %9 
                                      f32_3 %147 = OpLoad %139 
                                      f32_3 %148 = OpFAdd %146 %147 
                                                     OpStore %9 %148 
                                      f32_3 %149 = OpLoad %118 
                                      f32_3 %150 = OpLoad %9 
                                      f32_3 %151 = OpFAdd %149 %150 
                                                     OpStore %9 %151 
                                      f32_3 %154 = OpLoad %9 
                                      f32_3 %157 = OpFMul %154 %156 
                                      f32_4 %158 = OpLoad %153 
                                      f32_4 %159 = OpVectorShuffle %158 %157 4 5 6 3 
                                                     OpStore %153 %159 
                                Output f32* %162 = OpAccessChain %153 %160 
                                                     OpStore %162 %57 
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