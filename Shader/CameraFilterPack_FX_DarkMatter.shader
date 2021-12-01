//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_DarkMatter" {
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
  GpuProgramID 19699
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
uniform 	float _Value4;
uniform 	float _Value5;
uniform 	float _Value6;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
vec2 u_xlat3;
float u_xlat5;
vec2 u_xlat6;
vec2 u_xlat8;
float u_xlat9;
bool u_xlatb9;
vec2 u_xlat10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = (-_Value3);
    u_xlat1.y = (-_Value4);
    u_xlat8.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value5, _Value5));
    u_xlat1.x = float(1.0);
    u_xlat5 = float(0.0);
    while(true){
        u_xlatb9 = u_xlat5>=10.0;
        if(u_xlatb9){break;}
        u_xlat9 = _TimeX * _Value + u_xlat5;
        u_xlat13 = u_xlat5 * 0.25;
        u_xlat2.x = sin(u_xlat9);
        u_xlat6.xy = vec2(u_xlat9) * vec2(1.51999998, 1.10000002);
        u_xlat10.xy = cos(u_xlat6.xy);
        u_xlat3.x = u_xlat10.x * u_xlat2.x;
        u_xlat9 = sin(u_xlat6.x);
        u_xlat3.y = u_xlat9 * u_xlat10.y;
        u_xlat2.xy = u_xlat8.xy + (-u_xlat3.xy);
        u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
        u_xlat9 = sqrt(u_xlat9);
        u_xlat9 = u_xlat9 * -3.77069688;
        u_xlat9 = exp2(u_xlat9);
        u_xlat13 = sin(u_xlat13);
        u_xlat9 = u_xlat9 * u_xlat13 + 1.0;
        u_xlat9 = u_xlat1.x * u_xlat9;
        u_xlat1.x = u_xlat9 * 0.850000024;
        u_xlat5 = u_xlat5 + 1.0;
    }
    u_xlat8.x = u_xlat1.x * _Value2;
    u_xlat8.x = u_xlat8.x * 0.300000012;
    u_xlat12 = _Value2 * -0.0599999987 + u_xlat8.x;
    u_xlat0.xy = vec2(u_xlat12) + u_xlat0.xy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    SV_Target0 = (-u_xlat8.xxxx) * vec4(vec4(_Value6, _Value6, _Value6, _Value6)) + u_xlat1;
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
; Bound: 214
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %191 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %180 DescriptorSet 180 
                                                      OpDecorate %180 Binding 180 
                                                      OpDecorate %184 DescriptorSet 184 
                                                      OpDecorate %184 Binding 184 
                                                      OpDecorate %191 Location 191 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private f32_2* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %13 = OpTypeVector %6 4 
                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %13 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 7 
                                              %19 = OpTypePointer Uniform %13 
                                              %28 = OpTypePointer Private %13 
                               Private f32_4* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 3 
                                              %31 = OpTypePointer Uniform %6 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                                              %37 = OpTypePointer Private %6 
                                          i32 %39 = OpConstant 4 
                                          u32 %43 = OpConstant 1 
                               Private f32_2* %45 = OpVariable Private 
                                          i32 %51 = OpConstant 5 
                                          f32 %61 = OpConstant 3.674022E-40 
                                 Private f32* %63 = OpVariable Private 
                                          f32 %64 = OpConstant 3.674022E-40 
                                              %70 = OpTypeBool 
                                         bool %71 = OpConstantTrue 
                                              %72 = OpTypePointer Private %70 
                                Private bool* %73 = OpVariable Private 
                                          f32 %75 = OpConstant 3.674022E-40 
                                 Private f32* %81 = OpVariable Private 
                                          i32 %82 = OpConstant 0 
                                          i32 %85 = OpConstant 1 
                                 Private f32* %91 = OpVariable Private 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %95 = OpVariable Private 
                               Private f32_2* %99 = OpVariable Private 
                                         f32 %102 = OpConstant 3.674022E-40 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_2 %104 = OpConstantComposite %102 %103 
                              Private f32_2* %106 = OpVariable Private 
                              Private f32_2* %109 = OpVariable Private 
                                         f32 %134 = OpConstant 3.674022E-40 
                                         f32 %149 = OpConstant 3.674022E-40 
                                         i32 %156 = OpConstant 2 
                                         f32 %163 = OpConstant 3.674022E-40 
                                Private f32* %166 = OpVariable Private 
                                         f32 %169 = OpConstant 3.674022E-40 
                                             %178 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %179 = OpTypePointer UniformConstant %178 
        UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
                                             %182 = OpTypeSampler 
                                             %183 = OpTypePointer UniformConstant %182 
                    UniformConstant sampler* %184 = OpVariable UniformConstant 
                                             %186 = OpTypeSampledImage %178 
                                             %190 = OpTypePointer Output %13 
                               Output f32_4* %191 = OpVariable Output 
                                         i32 %195 = OpConstant 6 
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
                                 Uniform f32* %32 = OpAccessChain %16 %30 
                                          f32 %33 = OpLoad %32 
                                          f32 %34 = OpFNegate %33 
                                 Private f32* %38 = OpAccessChain %29 %36 
                                                      OpStore %38 %34 
                                 Uniform f32* %40 = OpAccessChain %16 %39 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                 Private f32* %44 = OpAccessChain %29 %43 
                                                      OpStore %44 %42 
                                        f32_2 %46 = OpLoad %9 
                                        f32_4 %47 = OpLoad %29 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFAdd %46 %48 
                                                      OpStore %45 %49 
                                        f32_2 %50 = OpLoad %45 
                                 Uniform f32* %52 = OpAccessChain %16 %51 
                                          f32 %53 = OpLoad %52 
                                 Uniform f32* %54 = OpAccessChain %16 %51 
                                          f32 %55 = OpLoad %54 
                                        f32_2 %56 = OpCompositeConstruct %53 %55 
                                          f32 %57 = OpCompositeExtract %56 0 
                                          f32 %58 = OpCompositeExtract %56 1 
                                        f32_2 %59 = OpCompositeConstruct %57 %58 
                                        f32_2 %60 = OpFDiv %50 %59 
                                                      OpStore %45 %60 
                                 Private f32* %62 = OpAccessChain %29 %36 
                                                      OpStore %62 %61 
                                                      OpStore %63 %64 
                                                      OpBranch %65 
                                              %65 = OpLabel 
                                                      OpLoopMerge %67 %68 None 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                                      OpBranchConditional %71 %66 %67 
                                              %66 = OpLabel 
                                          f32 %74 = OpLoad %63 
                                         bool %76 = OpFOrdGreaterThanEqual %74 %75 
                                                      OpStore %73 %76 
                                         bool %77 = OpLoad %73 
                                                      OpSelectionMerge %79 None 
                                                      OpBranchConditional %77 %78 %79 
                                              %78 = OpLabel 
                                                      OpBranch %67 
                                              %79 = OpLabel 
                                 Uniform f32* %83 = OpAccessChain %16 %82 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %86 = OpAccessChain %16 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFMul %84 %87 
                                          f32 %89 = OpLoad %63 
                                          f32 %90 = OpFAdd %88 %89 
                                                      OpStore %81 %90 
                                          f32 %92 = OpLoad %63 
                                          f32 %94 = OpFMul %92 %93 
                                                      OpStore %91 %94 
                                          f32 %96 = OpLoad %81 
                                          f32 %97 = OpExtInst %1 13 %96 
                                 Private f32* %98 = OpAccessChain %95 %36 
                                                      OpStore %98 %97 
                                         f32 %100 = OpLoad %81 
                                       f32_2 %101 = OpCompositeConstruct %100 %100 
                                       f32_2 %105 = OpFMul %101 %104 
                                                      OpStore %99 %105 
                                       f32_2 %107 = OpLoad %99 
                                       f32_2 %108 = OpExtInst %1 14 %107 
                                                      OpStore %106 %108 
                                Private f32* %110 = OpAccessChain %106 %36 
                                         f32 %111 = OpLoad %110 
                                Private f32* %112 = OpAccessChain %95 %36 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %111 %113 
                                Private f32* %115 = OpAccessChain %109 %36 
                                                      OpStore %115 %114 
                                Private f32* %116 = OpAccessChain %99 %36 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpExtInst %1 13 %117 
                                                      OpStore %81 %118 
                                         f32 %119 = OpLoad %81 
                                Private f32* %120 = OpAccessChain %106 %43 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %119 %121 
                                Private f32* %123 = OpAccessChain %109 %43 
                                                      OpStore %123 %122 
                                       f32_2 %124 = OpLoad %45 
                                       f32_2 %125 = OpLoad %109 
                                       f32_2 %126 = OpFNegate %125 
                                       f32_2 %127 = OpFAdd %124 %126 
                                                      OpStore %95 %127 
                                       f32_2 %128 = OpLoad %95 
                                       f32_2 %129 = OpLoad %95 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %81 %130 
                                         f32 %131 = OpLoad %81 
                                         f32 %132 = OpExtInst %1 31 %131 
                                                      OpStore %81 %132 
                                         f32 %133 = OpLoad %81 
                                         f32 %135 = OpFMul %133 %134 
                                                      OpStore %81 %135 
                                         f32 %136 = OpLoad %81 
                                         f32 %137 = OpExtInst %1 29 %136 
                                                      OpStore %81 %137 
                                         f32 %138 = OpLoad %91 
                                         f32 %139 = OpExtInst %1 13 %138 
                                                      OpStore %91 %139 
                                         f32 %140 = OpLoad %81 
                                         f32 %141 = OpLoad %91 
                                         f32 %142 = OpFMul %140 %141 
                                         f32 %143 = OpFAdd %142 %61 
                                                      OpStore %81 %143 
                                Private f32* %144 = OpAccessChain %29 %36 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpLoad %81 
                                         f32 %147 = OpFMul %145 %146 
                                                      OpStore %81 %147 
                                         f32 %148 = OpLoad %81 
                                         f32 %150 = OpFMul %148 %149 
                                Private f32* %151 = OpAccessChain %29 %36 
                                                      OpStore %151 %150 
                                         f32 %152 = OpLoad %63 
                                         f32 %153 = OpFAdd %152 %61 
                                                      OpStore %63 %153 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                                      OpBranch %65 
                                              %67 = OpLabel 
                                Private f32* %154 = OpAccessChain %29 %36 
                                         f32 %155 = OpLoad %154 
                                Uniform f32* %157 = OpAccessChain %16 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFMul %155 %158 
                                Private f32* %160 = OpAccessChain %45 %36 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %45 %36 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                Private f32* %165 = OpAccessChain %45 %36 
                                                      OpStore %165 %164 
                                Uniform f32* %167 = OpAccessChain %16 %156 
                                         f32 %168 = OpLoad %167 
                                         f32 %170 = OpFMul %168 %169 
                                Private f32* %171 = OpAccessChain %45 %36 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %170 %172 
                                                      OpStore %166 %173 
                                         f32 %174 = OpLoad %166 
                                       f32_2 %175 = OpCompositeConstruct %174 %174 
                                       f32_2 %176 = OpLoad %9 
                                       f32_2 %177 = OpFAdd %175 %176 
                                                      OpStore %9 %177 
                         read_only Texture2D %181 = OpLoad %180 
                                     sampler %185 = OpLoad %184 
                  read_only Texture2DSampled %187 = OpSampledImage %181 %185 
                                       f32_2 %188 = OpLoad %9 
                                       f32_4 %189 = OpImageSampleImplicitLod %187 %188 
                                                      OpStore %29 %189 
                                       f32_2 %192 = OpLoad %45 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
                                       f32_4 %194 = OpFNegate %193 
                                Uniform f32* %196 = OpAccessChain %16 %195 
                                         f32 %197 = OpLoad %196 
                                Uniform f32* %198 = OpAccessChain %16 %195 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %200 = OpAccessChain %16 %195 
                                         f32 %201 = OpLoad %200 
                                Uniform f32* %202 = OpAccessChain %16 %195 
                                         f32 %203 = OpLoad %202 
                                       f32_4 %204 = OpCompositeConstruct %197 %199 %201 %203 
                                         f32 %205 = OpCompositeExtract %204 0 
                                         f32 %206 = OpCompositeExtract %204 1 
                                         f32 %207 = OpCompositeExtract %204 2 
                                         f32 %208 = OpCompositeExtract %204 3 
                                       f32_4 %209 = OpCompositeConstruct %205 %206 %207 %208 
                                       f32_4 %210 = OpFMul %194 %209 
                                       f32_4 %211 = OpLoad %29 
                                       f32_4 %212 = OpFAdd %210 %211 
                                                      OpStore %191 %212 
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