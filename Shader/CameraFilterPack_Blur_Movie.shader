//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blur_Movie" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Radius ("_Radius", Range(0, 1000)) = 700
_Factor ("_Factor", Range(0, 1000)) = 200
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 8044
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
uniform 	vec4 _ScreenResolution;
uniform 	float _Radius;
uniform 	float _Factor;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
vec2 u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16.xy = vec2(_Factor, _Radius) / _ScreenResolution.yx;
    u_xlat16.x = u_xlat16.x * 64.0;
    u_xlat24 = u_xlat16.y + u_xlat16.y;
    u_xlat1.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat2.w = float(0.0);
    u_xlat3.x = float(0.0);
    u_xlat3.y = float(0.0);
    u_xlat3.z = float(0.0);
    u_xlat3.w = float(0.0);
    u_xlat17 = -5.0;
    while(true){
        u_xlatb25 = u_xlat17>=5.0;
        if(u_xlatb25){break;}
        u_xlat4 = u_xlat2;
        u_xlat5 = u_xlat3;
        u_xlat25 = -5.0;
        while(true){
            u_xlatb6 = u_xlat25>=5.0;
            if(u_xlatb6){break;}
            u_xlat6.x = u_xlat17 + u_xlat25;
            u_xlat6.y = (-u_xlat25) + u_xlat17;
            u_xlat6.xy = u_xlat1.xy * u_xlat6.xy;
            u_xlat6.xy = u_xlat6.xy * vec2(u_xlat24) + u_xlat0.xy;
            u_xlat6 = textureLod(_MainTex, u_xlat6.xy, 0.0);
            u_xlat7 = u_xlat6 * u_xlat6;
            u_xlat7 = u_xlat6 * u_xlat7;
            u_xlat7 = u_xlat7 * u_xlat16.xxxx + vec4(1.0, 1.0, 1.0, 1.0);
            u_xlat4 = u_xlat6 * u_xlat7 + u_xlat4;
            u_xlat5 = u_xlat5 + u_xlat7;
            u_xlat25 = u_xlat25 + 1.0;
        }
        u_xlat2 = u_xlat4;
        u_xlat3 = u_xlat5;
        u_xlat17 = u_xlat17 + 1.0;
    }
    SV_Target0 = u_xlat2 / u_xlat3;
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
; Bound: 184
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %179 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 11 
                                                  OpMemberDecorate %14 0 Offset 14 
                                                  OpMemberDecorate %14 1 Offset 14 
                                                  OpMemberDecorate %14 2 Offset 14 
                                                  OpMemberDecorate %14 3 Offset 14 
                                                  OpDecorate %14 Block 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate %140 DescriptorSet 140 
                                                  OpDecorate %140 Binding 140 
                                                  OpDecorate %144 DescriptorSet 144 
                                                  OpDecorate %144 Binding 144 
                                                  OpDecorate %179 Location 179 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 2 
                                           %8 = OpTypePointer Private %7 
                            Private f32_2* %9 = OpVariable Private 
                                          %10 = OpTypePointer Input %7 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %13 = OpTypeVector %6 4 
                                          %14 = OpTypeStruct %13 %6 %6 %13 
                                          %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                          %17 = OpTypeInt 32 1 
                                      i32 %18 = OpConstant 3 
                                          %19 = OpTypePointer Uniform %13 
                           Private f32_2* %28 = OpVariable Private 
                                      i32 %29 = OpConstant 2 
                                          %30 = OpTypePointer Uniform %6 
                                      i32 %33 = OpConstant 1 
                                      i32 %37 = OpConstant 0 
                                          %42 = OpTypeInt 32 0 
                                      u32 %43 = OpConstant 0 
                                          %44 = OpTypePointer Private %6 
                                      f32 %47 = OpConstant 3.674022E-40 
                             Private f32* %50 = OpVariable Private 
                                      u32 %51 = OpConstant 1 
                           Private f32_2* %57 = OpVariable Private 
                                      f32 %58 = OpConstant 3.674022E-40 
                                    f32_2 %59 = OpConstantComposite %58 %58 
                                          %64 = OpTypePointer Private %13 
                           Private f32_4* %65 = OpVariable Private 
                                      f32 %66 = OpConstant 3.674022E-40 
                                      u32 %69 = OpConstant 2 
                                      u32 %71 = OpConstant 3 
                           Private f32_4* %73 = OpVariable Private 
                             Private f32* %78 = OpVariable Private 
                                      f32 %79 = OpConstant 3.674022E-40 
                                          %85 = OpTypeBool 
                                     bool %86 = OpConstantTrue 
                                          %87 = OpTypePointer Private %85 
                            Private bool* %88 = OpVariable Private 
                                      f32 %90 = OpConstant 3.674022E-40 
                           Private f32_4* %96 = OpVariable Private 
                           Private f32_4* %98 = OpVariable Private 
                            Private f32* %100 = OpVariable Private 
                           Private bool* %106 = OpVariable Private 
                          Private f32_4* %113 = OpVariable Private 
                                         %138 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                         %139 = OpTypePointer UniformConstant %138 
    UniformConstant read_only Texture2D* %140 = OpVariable UniformConstant 
                                         %142 = OpTypeSampler 
                                         %143 = OpTypePointer UniformConstant %142 
                UniformConstant sampler* %144 = OpVariable UniformConstant 
                                         %146 = OpTypeSampledImage %138 
                          Private f32_4* %151 = OpVariable Private 
                                   f32_4 %162 = OpConstantComposite %58 %58 %58 %58 
                                         %178 = OpTypePointer Output %13 
                           Output f32_4* %179 = OpVariable Output 
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
                             Uniform f32* %31 = OpAccessChain %16 %29 
                                      f32 %32 = OpLoad %31 
                             Uniform f32* %34 = OpAccessChain %16 %33 
                                      f32 %35 = OpLoad %34 
                                    f32_2 %36 = OpCompositeConstruct %32 %35 
                           Uniform f32_4* %38 = OpAccessChain %16 %37 
                                    f32_4 %39 = OpLoad %38 
                                    f32_2 %40 = OpVectorShuffle %39 %39 1 0 
                                    f32_2 %41 = OpFDiv %36 %40 
                                                  OpStore %28 %41 
                             Private f32* %45 = OpAccessChain %28 %43 
                                      f32 %46 = OpLoad %45 
                                      f32 %48 = OpFMul %46 %47 
                             Private f32* %49 = OpAccessChain %28 %43 
                                                  OpStore %49 %48 
                             Private f32* %52 = OpAccessChain %28 %51 
                                      f32 %53 = OpLoad %52 
                             Private f32* %54 = OpAccessChain %28 %51 
                                      f32 %55 = OpLoad %54 
                                      f32 %56 = OpFAdd %53 %55 
                                                  OpStore %50 %56 
                           Uniform f32_4* %60 = OpAccessChain %16 %37 
                                    f32_4 %61 = OpLoad %60 
                                    f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                    f32_2 %63 = OpFDiv %59 %62 
                                                  OpStore %57 %63 
                             Private f32* %67 = OpAccessChain %65 %43 
                                                  OpStore %67 %66 
                             Private f32* %68 = OpAccessChain %65 %51 
                                                  OpStore %68 %66 
                             Private f32* %70 = OpAccessChain %65 %69 
                                                  OpStore %70 %66 
                             Private f32* %72 = OpAccessChain %65 %71 
                                                  OpStore %72 %66 
                             Private f32* %74 = OpAccessChain %73 %43 
                                                  OpStore %74 %66 
                             Private f32* %75 = OpAccessChain %73 %51 
                                                  OpStore %75 %66 
                             Private f32* %76 = OpAccessChain %73 %69 
                                                  OpStore %76 %66 
                             Private f32* %77 = OpAccessChain %73 %71 
                                                  OpStore %77 %66 
                                                  OpStore %78 %79 
                                                  OpBranch %80 
                                          %80 = OpLabel 
                                                  OpLoopMerge %82 %83 None 
                                                  OpBranch %84 
                                          %84 = OpLabel 
                                                  OpBranchConditional %86 %81 %82 
                                          %81 = OpLabel 
                                      f32 %89 = OpLoad %78 
                                     bool %91 = OpFOrdGreaterThanEqual %89 %90 
                                                  OpStore %88 %91 
                                     bool %92 = OpLoad %88 
                                                  OpSelectionMerge %94 None 
                                                  OpBranchConditional %92 %93 %94 
                                          %93 = OpLabel 
                                                  OpBranch %82 
                                          %94 = OpLabel 
                                    f32_4 %97 = OpLoad %65 
                                                  OpStore %96 %97 
                                    f32_4 %99 = OpLoad %73 
                                                  OpStore %98 %99 
                                                  OpStore %100 %79 
                                                  OpBranch %101 
                                         %101 = OpLabel 
                                                  OpLoopMerge %103 %104 None 
                                                  OpBranch %105 
                                         %105 = OpLabel 
                                                  OpBranchConditional %86 %102 %103 
                                         %102 = OpLabel 
                                     f32 %107 = OpLoad %100 
                                    bool %108 = OpFOrdGreaterThanEqual %107 %90 
                                                  OpStore %106 %108 
                                    bool %109 = OpLoad %106 
                                                  OpSelectionMerge %111 None 
                                                  OpBranchConditional %109 %110 %111 
                                         %110 = OpLabel 
                                                  OpBranch %103 
                                         %111 = OpLabel 
                                     f32 %114 = OpLoad %78 
                                     f32 %115 = OpLoad %100 
                                     f32 %116 = OpFAdd %114 %115 
                            Private f32* %117 = OpAccessChain %113 %43 
                                                  OpStore %117 %116 
                                     f32 %118 = OpLoad %100 
                                     f32 %119 = OpFNegate %118 
                                     f32 %120 = OpLoad %78 
                                     f32 %121 = OpFAdd %119 %120 
                            Private f32* %122 = OpAccessChain %113 %51 
                                                  OpStore %122 %121 
                                   f32_2 %123 = OpLoad %57 
                                   f32_4 %124 = OpLoad %113 
                                   f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                   f32_2 %126 = OpFMul %123 %125 
                                   f32_4 %127 = OpLoad %113 
                                   f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                  OpStore %113 %128 
                                   f32_4 %129 = OpLoad %113 
                                   f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                     f32 %131 = OpLoad %50 
                                   f32_2 %132 = OpCompositeConstruct %131 %131 
                                   f32_2 %133 = OpFMul %130 %132 
                                   f32_2 %134 = OpLoad %9 
                                   f32_2 %135 = OpFAdd %133 %134 
                                   f32_4 %136 = OpLoad %113 
                                   f32_4 %137 = OpVectorShuffle %136 %135 4 5 2 3 
                                                  OpStore %113 %137 
                     read_only Texture2D %141 = OpLoad %140 
                                 sampler %145 = OpLoad %144 
              read_only Texture2DSampled %147 = OpSampledImage %141 %145 
                                   f32_4 %148 = OpLoad %113 
                                   f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                   f32_4 %150 = OpImageSampleExplicitLod %147 %149 Lod %13 
                                                  OpStore %113 %150 
                                   f32_4 %152 = OpLoad %113 
                                   f32_4 %153 = OpLoad %113 
                                   f32_4 %154 = OpFMul %152 %153 
                                                  OpStore %151 %154 
                                   f32_4 %155 = OpLoad %113 
                                   f32_4 %156 = OpLoad %151 
                                   f32_4 %157 = OpFMul %155 %156 
                                                  OpStore %151 %157 
                                   f32_4 %158 = OpLoad %151 
                                   f32_2 %159 = OpLoad %28 
                                   f32_4 %160 = OpVectorShuffle %159 %159 0 0 0 0 
                                   f32_4 %161 = OpFMul %158 %160 
                                   f32_4 %163 = OpFAdd %161 %162 
                                                  OpStore %151 %163 
                                   f32_4 %164 = OpLoad %113 
                                   f32_4 %165 = OpLoad %151 
                                   f32_4 %166 = OpFMul %164 %165 
                                   f32_4 %167 = OpLoad %96 
                                   f32_4 %168 = OpFAdd %166 %167 
                                                  OpStore %96 %168 
                                   f32_4 %169 = OpLoad %98 
                                   f32_4 %170 = OpLoad %151 
                                   f32_4 %171 = OpFAdd %169 %170 
                                                  OpStore %98 %171 
                                     f32 %172 = OpLoad %100 
                                     f32 %173 = OpFAdd %172 %58 
                                                  OpStore %100 %173 
                                                  OpBranch %104 
                                         %104 = OpLabel 
                                                  OpBranch %101 
                                         %103 = OpLabel 
                                   f32_4 %174 = OpLoad %96 
                                                  OpStore %65 %174 
                                   f32_4 %175 = OpLoad %98 
                                                  OpStore %73 %175 
                                     f32 %176 = OpLoad %78 
                                     f32 %177 = OpFAdd %176 %58 
                                                  OpStore %78 %177 
                                                  OpBranch %83 
                                          %83 = OpLabel 
                                                  OpBranch %80 
                                          %82 = OpLabel 
                                   f32_4 %180 = OpLoad %65 
                                   f32_4 %181 = OpLoad %73 
                                   f32_4 %182 = OpFDiv %180 %181 
                                                  OpStore %179 %182 
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