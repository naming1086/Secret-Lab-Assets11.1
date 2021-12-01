//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Blur_Dithering2x2" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Level ("_Level", Range(1, 16)) = 4
_Distance ("_Distance", Vector) = (30,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 55139
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
uniform 	float _Level;
uniform 	vec4 _Distance;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec4 u_xlat3;
int u_xlati4;
vec4 u_xlat5;
bool u_xlatb10;
int u_xlati12;
vec2 u_xlat13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlati12 = int(_Level);
    u_xlat18 = trunc(_Level);
    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
    u_xlat2.x = u_xlat18 + -1.0;
    u_xlat1.xy = u_xlat1.xy / u_xlat2.xx;
    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + vec2(-0.0, -1.0);
    u_xlatb0.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
    u_xlat0.x = u_xlatb0.x ? float(0.75) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(0.25) : 0.0;
;
    u_xlat0.x = u_xlat0.y + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
    u_xlat2 = textureLod(_MainTex, u_xlat0.xy, 0.0);
    u_xlat3 = u_xlat2;
    u_xlat13.xy = u_xlat0.xy;
    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati12 ; u_xlati_loop_1++)
    {
        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
        u_xlat5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
        u_xlat3 = u_xlat3 + u_xlat5;
    }
    SV_Target0 = u_xlat3 / vec4(u_xlat18);
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
; Bound: 227
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %219 
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
                                                    OpDecorate %181 DescriptorSet 181 
                                                    OpDecorate %181 Binding 181 
                                                    OpDecorate %185 DescriptorSet 185 
                                                    OpDecorate %185 Binding 185 
                                                    OpDecorate %219 Location 219 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                      Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                            %13 = OpTypeVector %6 4 
                                            %14 = OpTypeStruct %13 %6 %13 %13 
                                            %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                            %17 = OpTypeInt 32 1 
                                        i32 %18 = OpConstant 3 
                                            %19 = OpTypePointer Uniform %13 
                                            %28 = OpTypePointer Private %17 
                               Private i32* %29 = OpVariable Private 
                                        i32 %30 = OpConstant 1 
                                            %31 = OpTypePointer Uniform %6 
                                            %35 = OpTypePointer Private %6 
                               Private f32* %36 = OpVariable Private 
                             Private f32_2* %40 = OpVariable Private 
                                        i32 %41 = OpConstant 2 
                                        i32 %45 = OpConstant 0 
                             Private f32_2* %50 = OpVariable Private 
                                        f32 %53 = OpConstant 3.674022E-40 
                                      f32_2 %54 = OpConstantComposite %53 %53 
                                            %66 = OpTypePointer Private %13 
                             Private f32_4* %67 = OpVariable Private 
                                        f32 %69 = OpConstant 3.674022E-40 
                                            %71 = OpTypeInt 32 0 
                                        u32 %72 = OpConstant 0 
                                            %85 = OpTypeBool 
                                            %86 = OpTypeVector %85 2 
                                            %87 = OpTypePointer Private %86 
                            Private bool_2* %88 = OpVariable Private 
                                            %94 = OpTypeVector %85 4 
                                           %100 = OpTypePointer Function %7 
                                           %103 = OpTypePointer Private %85 
                                           %106 = OpTypePointer Function %6 
                                       u32 %118 = OpConstant 1 
                                       f32 %146 = OpConstant 3.674022E-40 
                                     f32_2 %147 = OpConstantComposite %146 %69 
                           Private bool_2* %149 = OpVariable Private 
                                       f32 %150 = OpConstant 3.674022E-40 
                                     f32_4 %151 = OpConstantComposite %53 %53 %150 %150 
                                       f32 %159 = OpConstant 3.674022E-40 
                                       f32 %164 = OpConstant 3.674022E-40 
                                           %179 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                           %180 = OpTypePointer UniformConstant %179 
      UniformConstant read_only Texture2D* %181 = OpVariable UniformConstant 
                                           %183 = OpTypeSampler 
                                           %184 = OpTypePointer UniformConstant %183 
                  UniformConstant sampler* %185 = OpVariable UniformConstant 
                                           %187 = OpTypeSampledImage %179 
                            Private f32_4* %191 = OpVariable Private 
                                           %194 = OpTypePointer Function %17 
                            Private f32_4* %207 = OpVariable Private 
                                           %218 = OpTypePointer Output %13 
                             Output f32_4* %219 = OpVariable Output 
                              Private i32* %225 = OpVariable Private 
                             Private bool* %226 = OpVariable Private 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                           Function f32_2* %101 = OpVariable Function 
                             Function f32* %107 = OpVariable Function 
                             Function f32* %121 = OpVariable Function 
                             Function i32* %195 = OpVariable Function 
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
                               Uniform f32* %32 = OpAccessChain %16 %30 
                                        f32 %33 = OpLoad %32 
                                        i32 %34 = OpConvertFToS %33 
                                                    OpStore %29 %34 
                               Uniform f32* %37 = OpAccessChain %16 %30 
                                        f32 %38 = OpLoad %37 
                                        f32 %39 = OpExtInst %1 3 %38 
                                                    OpStore %36 %39 
                             Uniform f32_4* %42 = OpAccessChain %16 %41 
                                      f32_4 %43 = OpLoad %42 
                                      f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                             Uniform f32_4* %46 = OpAccessChain %16 %45 
                                      f32_4 %47 = OpLoad %46 
                                      f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                      f32_2 %49 = OpFDiv %44 %48 
                                                    OpStore %40 %49 
                                      f32_2 %51 = OpLoad %40 
                                      f32_2 %52 = OpFNegate %51 
                                      f32_2 %55 = OpFMul %52 %54 
                                      f32_2 %56 = OpLoad %9 
                                      f32_2 %57 = OpFAdd %55 %56 
                                                    OpStore %50 %57 
                                      f32_2 %58 = OpLoad %40 
                                      f32_2 %59 = OpFMul %58 %54 
                                      f32_2 %60 = OpLoad %9 
                                      f32_2 %61 = OpFAdd %59 %60 
                                                    OpStore %40 %61 
                                      f32_2 %62 = OpLoad %50 
                                      f32_2 %63 = OpFNegate %62 
                                      f32_2 %64 = OpLoad %40 
                                      f32_2 %65 = OpFAdd %63 %64 
                                                    OpStore %40 %65 
                                        f32 %68 = OpLoad %36 
                                        f32 %70 = OpFAdd %68 %69 
                               Private f32* %73 = OpAccessChain %67 %72 
                                                    OpStore %73 %70 
                                      f32_2 %74 = OpLoad %40 
                                      f32_4 %75 = OpLoad %67 
                                      f32_2 %76 = OpVectorShuffle %75 %75 0 0 
                                      f32_2 %77 = OpFDiv %74 %76 
                                                    OpStore %40 %77 
                                      f32_2 %78 = OpLoad %9 
                             Uniform f32_4* %79 = OpAccessChain %16 %45 
                                      f32_4 %80 = OpLoad %79 
                                      f32_2 %81 = OpVectorShuffle %80 %80 0 1 
                                      f32_2 %82 = OpFMul %78 %81 
                                                    OpStore %9 %82 
                                      f32_2 %83 = OpLoad %9 
                                      f32_2 %84 = OpFMul %83 %54 
                                                    OpStore %9 %84 
                                      f32_2 %89 = OpLoad %9 
                                      f32_4 %90 = OpVectorShuffle %89 %89 0 1 0 0 
                                      f32_2 %91 = OpLoad %9 
                                      f32_4 %92 = OpVectorShuffle %91 %91 0 1 0 0 
                                      f32_4 %93 = OpFNegate %92 
                                     bool_4 %95 = OpFOrdGreaterThanEqual %90 %93 
                                     bool_2 %96 = OpVectorShuffle %95 %95 0 1 
                                                    OpStore %88 %96 
                                      f32_2 %97 = OpLoad %9 
                                      f32_2 %98 = OpExtInst %1 4 %97 
                                      f32_2 %99 = OpExtInst %1 10 %98 
                                                    OpStore %9 %99 
                                     f32_2 %102 = OpLoad %9 
                                                    OpStore %101 %102 
                             Private bool* %104 = OpAccessChain %88 %72 
                                      bool %105 = OpLoad %104 
                                                    OpSelectionMerge %109 None 
                                                    OpBranchConditional %105 %108 %112 
                                           %108 = OpLabel 
                              Private f32* %110 = OpAccessChain %9 %72 
                                       f32 %111 = OpLoad %110 
                                                    OpStore %107 %111 
                                                    OpBranch %109 
                                           %112 = OpLabel 
                              Private f32* %113 = OpAccessChain %9 %72 
                                       f32 %114 = OpLoad %113 
                                       f32 %115 = OpFNegate %114 
                                                    OpStore %107 %115 
                                                    OpBranch %109 
                                           %109 = OpLabel 
                                       f32 %116 = OpLoad %107 
                             Function f32* %117 = OpAccessChain %101 %72 
                                                    OpStore %117 %116 
                             Private bool* %119 = OpAccessChain %88 %118 
                                      bool %120 = OpLoad %119 
                                                    OpSelectionMerge %123 None 
                                                    OpBranchConditional %120 %122 %126 
                                           %122 = OpLabel 
                              Private f32* %124 = OpAccessChain %9 %118 
                                       f32 %125 = OpLoad %124 
                                                    OpStore %121 %125 
                                                    OpBranch %123 
                                           %126 = OpLabel 
                              Private f32* %127 = OpAccessChain %9 %118 
                                       f32 %128 = OpLoad %127 
                                       f32 %129 = OpFNegate %128 
                                                    OpStore %121 %129 
                                                    OpBranch %123 
                                           %123 = OpLabel 
                                       f32 %130 = OpLoad %121 
                             Function f32* %131 = OpAccessChain %101 %118 
                                                    OpStore %131 %130 
                                     f32_2 %132 = OpLoad %101 
                                                    OpStore %9 %132 
                                     f32_2 %133 = OpLoad %9 
                                     f32_2 %134 = OpLoad %9 
                                     f32_2 %135 = OpFAdd %133 %134 
                                                    OpStore %9 %135 
                                     f32_2 %136 = OpLoad %9 
                                     f32_2 %137 = OpExtInst %1 8 %136 
                                                    OpStore %9 %137 
                              Private f32* %138 = OpAccessChain %9 %118 
                                       f32 %139 = OpLoad %138 
                              Private f32* %140 = OpAccessChain %9 %72 
                                       f32 %141 = OpLoad %140 
                                       f32 %142 = OpFAdd %139 %141 
                              Private f32* %143 = OpAccessChain %9 %72 
                                                    OpStore %143 %142 
                                     f32_2 %144 = OpLoad %9 
                                     f32_2 %145 = OpVectorShuffle %144 %144 0 0 
                                     f32_2 %148 = OpFAdd %145 %147 
                                                    OpStore %9 %148 
                                     f32_2 %152 = OpLoad %9 
                                     f32_4 %153 = OpVectorShuffle %152 %152 0 1 0 0 
                                     f32_4 %154 = OpExtInst %1 4 %153 
                                    bool_4 %155 = OpFOrdGreaterThanEqual %151 %154 
                                    bool_2 %156 = OpVectorShuffle %155 %155 0 1 
                                                    OpStore %149 %156 
                             Private bool* %157 = OpAccessChain %149 %72 
                                      bool %158 = OpLoad %157 
                                       f32 %160 = OpSelect %158 %159 %150 
                              Private f32* %161 = OpAccessChain %9 %72 
                                                    OpStore %161 %160 
                             Private bool* %162 = OpAccessChain %149 %118 
                                      bool %163 = OpLoad %162 
                                       f32 %165 = OpSelect %163 %164 %150 
                              Private f32* %166 = OpAccessChain %9 %118 
                                                    OpStore %166 %165 
                              Private f32* %167 = OpAccessChain %9 %118 
                                       f32 %168 = OpLoad %167 
                              Private f32* %169 = OpAccessChain %9 %72 
                                       f32 %170 = OpLoad %169 
                                       f32 %171 = OpFAdd %168 %170 
                              Private f32* %172 = OpAccessChain %9 %72 
                                                    OpStore %172 %171 
                                     f32_2 %173 = OpLoad %9 
                                     f32_2 %174 = OpVectorShuffle %173 %173 0 0 
                                     f32_2 %175 = OpLoad %40 
                                     f32_2 %176 = OpFMul %174 %175 
                                     f32_2 %177 = OpLoad %50 
                                     f32_2 %178 = OpFAdd %176 %177 
                                                    OpStore %9 %178 
                       read_only Texture2D %182 = OpLoad %181 
                                   sampler %186 = OpLoad %185 
                read_only Texture2DSampled %188 = OpSampledImage %182 %186 
                                     f32_2 %189 = OpLoad %9 
                                     f32_4 %190 = OpImageSampleExplicitLod %188 %189 Lod %13 
                                                    OpStore %67 %190 
                                     f32_4 %192 = OpLoad %67 
                                                    OpStore %191 %192 
                                     f32_2 %193 = OpLoad %9 
                                                    OpStore %50 %193 
                                                    OpStore %195 %30 
                                                    OpBranch %196 
                                           %196 = OpLabel 
                                                    OpLoopMerge %198 %199 None 
                                                    OpBranch %200 
                                           %200 = OpLabel 
                                       i32 %201 = OpLoad %195 
                                       i32 %202 = OpLoad %29 
                                      bool %203 = OpSLessThan %201 %202 
                                                    OpBranchConditional %203 %197 %198 
                                           %197 = OpLabel 
                                     f32_2 %204 = OpLoad %40 
                                     f32_2 %205 = OpLoad %50 
                                     f32_2 %206 = OpFAdd %204 %205 
                                                    OpStore %50 %206 
                       read_only Texture2D %208 = OpLoad %181 
                                   sampler %209 = OpLoad %185 
                read_only Texture2DSampled %210 = OpSampledImage %208 %209 
                                     f32_2 %211 = OpLoad %50 
                                     f32_4 %212 = OpImageSampleExplicitLod %210 %211 Lod %13 
                                                    OpStore %207 %212 
                                     f32_4 %213 = OpLoad %191 
                                     f32_4 %214 = OpLoad %207 
                                     f32_4 %215 = OpFAdd %213 %214 
                                                    OpStore %191 %215 
                                                    OpBranch %199 
                                           %199 = OpLabel 
                                       i32 %216 = OpLoad %195 
                                       i32 %217 = OpIAdd %216 %30 
                                                    OpStore %195 %217 
                                                    OpBranch %196 
                                           %198 = OpLabel 
                                     f32_4 %220 = OpLoad %191 
                                       f32 %221 = OpLoad %36 
                                     f32_4 %222 = OpCompositeConstruct %221 %221 %221 %221 
                                     f32_4 %223 = OpFDiv %220 %222 
                                                    OpStore %219 %223 
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