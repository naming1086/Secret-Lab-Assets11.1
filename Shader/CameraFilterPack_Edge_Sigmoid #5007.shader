//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Edge_Sigmoid" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_Gain ("_Gain", Range(1, 10)) = 3
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 45774
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
uniform 	float _Gain;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
int u_xlati4;
vec4 u_xlat5;
float u_xlat6;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat10;
bool u_xlatb10;
vec2 u_xlat12;
bool u_xlatb16;
int u_xlati19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlati19 = int(int(0xFFFFFFFFu));
    while(true){
        u_xlat2 = float(u_xlati19);
        u_xlatb8 = 1.0<u_xlat2;
        if(u_xlatb8){break;}
        u_xlatb2 = u_xlat2==0.0;
        u_xlat3.yw = vec2(ivec2(u_xlati19));
        u_xlat8.xyz = u_xlat1.xyz;
        u_xlati4 = int(0xFFFFFFFFu);
        while(true){
            u_xlat10.x = float(u_xlati4);
            u_xlatb16 = 1.0<u_xlat10.x;
            if(u_xlatb16){break;}
            u_xlatb10 = u_xlat10.x==0.0;
            u_xlatb10 = u_xlatb2 && u_xlatb10;
            if(u_xlatb10){
                u_xlat3.x = float(u_xlati4);
                u_xlat10.xy = u_xlat12.xy * u_xlat3.xy + u_xlat0.xy;
                u_xlat5 = textureLod(_MainTex, u_xlat10.xy, 0.0);
                u_xlat8.xyz = u_xlat5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat8.xyz;
            } else {
                u_xlat3.z = float(u_xlati4);
                u_xlat3.xz = u_xlat12.xy * u_xlat3.zw + u_xlat0.xy;
                u_xlat5 = textureLod(_MainTex, u_xlat3.xz, 0.0);
                u_xlat8.xyz = u_xlat8.xyz + (-u_xlat5.xyz);
            }
            u_xlati4 = u_xlati4 + 1;
        }
        u_xlat1.xyz = u_xlat8.xyz;
        u_xlati19 = u_xlati19 + 1;
    }
    u_xlat0.x = u_xlat1.y + u_xlat1.x;
    u_xlat0.x = u_xlat1.z + u_xlat0.x;
    u_xlat6 = (-_Gain) + 10.0;
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = u_xlat0.x + -0.180000007;
    u_xlat0.x = u_xlat0.x * -12.9842558;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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
; Bound: 234
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %222 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %14 0 Offset 14 
                                              OpMemberDecorate %14 1 Offset 14 
                                              OpMemberDecorate %14 2 Offset 14 
                                              OpDecorate %14 Block 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %127 DescriptorSet 127 
                                              OpDecorate %127 Binding 127 
                                              OpDecorate %222 Location 222 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypeStruct %13 %6 %13 
                                      %15 = OpTypePointer Uniform %14 
 Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                      %17 = OpTypeInt 32 1 
                                  i32 %18 = OpConstant 2 
                                      %19 = OpTypePointer Uniform %13 
                       Private f32_2* %28 = OpVariable Private 
                                  f32 %29 = OpConstant 3.674022E-40 
                                f32_2 %30 = OpConstantComposite %29 %29 
                                  i32 %31 = OpConstant 0 
                                      %36 = OpTypeVector %6 3 
                                      %37 = OpTypePointer Private %36 
                       Private f32_3* %38 = OpVariable Private 
                                  f32 %39 = OpConstant 3.674022E-40 
                                      %40 = OpTypeInt 32 0 
                                  u32 %41 = OpConstant 0 
                                      %42 = OpTypePointer Private %6 
                                  u32 %44 = OpConstant 1 
                                  u32 %46 = OpConstant 2 
                                      %48 = OpTypePointer Private %17 
                         Private i32* %49 = OpVariable Private 
                                  i32 %50 = OpConstant -1 
                                      %56 = OpTypeBool 
                                 bool %57 = OpConstantTrue 
                         Private f32* %58 = OpVariable Private 
                                      %61 = OpTypePointer Private %56 
                        Private bool* %62 = OpVariable Private 
                        Private bool* %69 = OpVariable Private 
                                      %72 = OpTypePointer Private %13 
                       Private f32_4* %73 = OpVariable Private 
                                      %75 = OpTypeVector %17 2 
                       Private f32_3* %80 = OpVariable Private 
                         Private i32* %82 = OpVariable Private 
                       Private f32_3* %88 = OpVariable Private 
                        Private bool* %92 = OpVariable Private 
                       Private bool* %100 = OpVariable Private 
                                     %121 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %122 = OpTypePointer UniformConstant %121 
UniformConstant read_only Texture2D* %123 = OpVariable UniformConstant 
                                     %125 = OpTypeSampler 
                                     %126 = OpTypePointer UniformConstant %125 
            UniformConstant sampler* %127 = OpVariable UniformConstant 
                                     %129 = OpTypeSampledImage %121 
                                 f32 %136 = OpConstant 3.674022E-40 
                               f32_3 %137 = OpConstantComposite %136 %136 %136 
                                 i32 %165 = OpConstant 1 
                        Private f32* %182 = OpVariable Private 
                                     %183 = OpTypePointer Uniform %6 
                                 f32 %187 = OpConstant 3.674022E-40 
                                 f32 %196 = OpConstant 3.674022E-40 
                                 f32 %201 = OpConstant 3.674022E-40 
                                     %221 = OpTypePointer Output %13 
                       Output f32_4* %222 = OpVariable Output 
                                 u32 %230 = OpConstant 3 
                                     %231 = OpTypePointer Output %6 
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
                       Uniform f32_4* %32 = OpAccessChain %16 %31 
                                f32_4 %33 = OpLoad %32 
                                f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                f32_2 %35 = OpFDiv %30 %34 
                                              OpStore %28 %35 
                         Private f32* %43 = OpAccessChain %38 %41 
                                              OpStore %43 %39 
                         Private f32* %45 = OpAccessChain %38 %44 
                                              OpStore %45 %39 
                         Private f32* %47 = OpAccessChain %38 %46 
                                              OpStore %47 %39 
                                              OpStore %49 %50 
                                              OpBranch %51 
                                      %51 = OpLabel 
                                              OpLoopMerge %53 %54 None 
                                              OpBranch %55 
                                      %55 = OpLabel 
                                              OpBranchConditional %57 %52 %53 
                                      %52 = OpLabel 
                                  i32 %59 = OpLoad %49 
                                  f32 %60 = OpConvertSToF %59 
                                              OpStore %58 %60 
                                  f32 %63 = OpLoad %58 
                                 bool %64 = OpFOrdLessThan %29 %63 
                                              OpStore %62 %64 
                                 bool %65 = OpLoad %62 
                                              OpSelectionMerge %67 None 
                                              OpBranchConditional %65 %66 %67 
                                      %66 = OpLabel 
                                              OpBranch %53 
                                      %67 = OpLabel 
                                  f32 %70 = OpLoad %58 
                                 bool %71 = OpFOrdEqual %70 %39 
                                              OpStore %69 %71 
                                  i32 %74 = OpLoad %49 
                                i32_2 %76 = OpCompositeConstruct %74 %74 
                                f32_2 %77 = OpConvertSToF %76 
                                f32_4 %78 = OpLoad %73 
                                f32_4 %79 = OpVectorShuffle %78 %77 0 4 2 5 
                                              OpStore %73 %79 
                                f32_3 %81 = OpLoad %38 
                                              OpStore %80 %81 
                                              OpStore %82 %50 
                                              OpBranch %83 
                                      %83 = OpLabel 
                                              OpLoopMerge %85 %86 None 
                                              OpBranch %87 
                                      %87 = OpLabel 
                                              OpBranchConditional %57 %84 %85 
                                      %84 = OpLabel 
                                  i32 %89 = OpLoad %82 
                                  f32 %90 = OpConvertSToF %89 
                         Private f32* %91 = OpAccessChain %88 %41 
                                              OpStore %91 %90 
                         Private f32* %93 = OpAccessChain %88 %41 
                                  f32 %94 = OpLoad %93 
                                 bool %95 = OpFOrdLessThan %29 %94 
                                              OpStore %92 %95 
                                 bool %96 = OpLoad %92 
                                              OpSelectionMerge %98 None 
                                              OpBranchConditional %96 %97 %98 
                                      %97 = OpLabel 
                                              OpBranch %85 
                                      %98 = OpLabel 
                        Private f32* %101 = OpAccessChain %88 %41 
                                 f32 %102 = OpLoad %101 
                                bool %103 = OpFOrdEqual %102 %39 
                                              OpStore %100 %103 
                                bool %104 = OpLoad %69 
                                bool %105 = OpLoad %100 
                                bool %106 = OpLogicalAnd %104 %105 
                                              OpStore %100 %106 
                                bool %107 = OpLoad %100 
                                              OpSelectionMerge %109 None 
                                              OpBranchConditional %107 %108 %141 
                                     %108 = OpLabel 
                                 i32 %110 = OpLoad %82 
                                 f32 %111 = OpConvertSToF %110 
                        Private f32* %112 = OpAccessChain %73 %41 
                                              OpStore %112 %111 
                               f32_2 %113 = OpLoad %28 
                               f32_4 %114 = OpLoad %73 
                               f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                               f32_2 %116 = OpFMul %113 %115 
                               f32_2 %117 = OpLoad %9 
                               f32_2 %118 = OpFAdd %116 %117 
                               f32_3 %119 = OpLoad %88 
                               f32_3 %120 = OpVectorShuffle %119 %118 3 4 2 
                                              OpStore %88 %120 
                 read_only Texture2D %124 = OpLoad %123 
                             sampler %128 = OpLoad %127 
          read_only Texture2DSampled %130 = OpSampledImage %124 %128 
                               f32_3 %131 = OpLoad %88 
                               f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                               f32_4 %133 = OpImageSampleExplicitLod %130 %132 Lod %13 
                               f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                              OpStore %88 %134 
                               f32_3 %135 = OpLoad %88 
                               f32_3 %138 = OpFMul %135 %137 
                               f32_3 %139 = OpLoad %80 
                               f32_3 %140 = OpFAdd %138 %139 
                                              OpStore %80 %140 
                                              OpBranch %109 
                                     %141 = OpLabel 
                                 i32 %142 = OpLoad %82 
                                 f32 %143 = OpConvertSToF %142 
                        Private f32* %144 = OpAccessChain %73 %46 
                                              OpStore %144 %143 
                               f32_2 %145 = OpLoad %28 
                               f32_4 %146 = OpLoad %73 
                               f32_2 %147 = OpVectorShuffle %146 %146 2 3 
                               f32_2 %148 = OpFMul %145 %147 
                               f32_2 %149 = OpLoad %9 
                               f32_2 %150 = OpFAdd %148 %149 
                               f32_4 %151 = OpLoad %73 
                               f32_4 %152 = OpVectorShuffle %151 %150 4 1 5 3 
                                              OpStore %73 %152 
                 read_only Texture2D %153 = OpLoad %123 
                             sampler %154 = OpLoad %127 
          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
                               f32_4 %156 = OpLoad %73 
                               f32_2 %157 = OpVectorShuffle %156 %156 0 2 
                               f32_4 %158 = OpImageSampleExplicitLod %155 %157 Lod %13 
                               f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                              OpStore %88 %159 
                               f32_3 %160 = OpLoad %80 
                               f32_3 %161 = OpLoad %88 
                               f32_3 %162 = OpFNegate %161 
                               f32_3 %163 = OpFAdd %160 %162 
                                              OpStore %80 %163 
                                              OpBranch %109 
                                     %109 = OpLabel 
                                 i32 %164 = OpLoad %82 
                                 i32 %166 = OpIAdd %164 %165 
                                              OpStore %82 %166 
                                              OpBranch %86 
                                      %86 = OpLabel 
                                              OpBranch %83 
                                      %85 = OpLabel 
                               f32_3 %167 = OpLoad %80 
                                              OpStore %38 %167 
                                 i32 %168 = OpLoad %49 
                                 i32 %169 = OpIAdd %168 %165 
                                              OpStore %49 %169 
                                              OpBranch %54 
                                      %54 = OpLabel 
                                              OpBranch %51 
                                      %53 = OpLabel 
                        Private f32* %170 = OpAccessChain %38 %44 
                                 f32 %171 = OpLoad %170 
                        Private f32* %172 = OpAccessChain %38 %41 
                                 f32 %173 = OpLoad %172 
                                 f32 %174 = OpFAdd %171 %173 
                        Private f32* %175 = OpAccessChain %9 %41 
                                              OpStore %175 %174 
                        Private f32* %176 = OpAccessChain %38 %46 
                                 f32 %177 = OpLoad %176 
                        Private f32* %178 = OpAccessChain %9 %41 
                                 f32 %179 = OpLoad %178 
                                 f32 %180 = OpFAdd %177 %179 
                        Private f32* %181 = OpAccessChain %9 %41 
                                              OpStore %181 %180 
                        Uniform f32* %184 = OpAccessChain %16 %165 
                                 f32 %185 = OpLoad %184 
                                 f32 %186 = OpFNegate %185 
                                 f32 %188 = OpFAdd %186 %187 
                                              OpStore %182 %188 
                        Private f32* %189 = OpAccessChain %9 %41 
                                 f32 %190 = OpLoad %189 
                                 f32 %191 = OpLoad %182 
                                 f32 %192 = OpFDiv %190 %191 
                        Private f32* %193 = OpAccessChain %9 %41 
                                              OpStore %193 %192 
                        Private f32* %194 = OpAccessChain %9 %41 
                                 f32 %195 = OpLoad %194 
                                 f32 %197 = OpFAdd %195 %196 
                        Private f32* %198 = OpAccessChain %9 %41 
                                              OpStore %198 %197 
                        Private f32* %199 = OpAccessChain %9 %41 
                                 f32 %200 = OpLoad %199 
                                 f32 %202 = OpFMul %200 %201 
                        Private f32* %203 = OpAccessChain %9 %41 
                                              OpStore %203 %202 
                        Private f32* %204 = OpAccessChain %9 %41 
                                 f32 %205 = OpLoad %204 
                                 f32 %206 = OpExtInst %1 29 %205 
                        Private f32* %207 = OpAccessChain %9 %41 
                                              OpStore %207 %206 
                        Private f32* %208 = OpAccessChain %9 %41 
                                 f32 %209 = OpLoad %208 
                                 f32 %210 = OpFAdd %209 %29 
                        Private f32* %211 = OpAccessChain %9 %41 
                                              OpStore %211 %210 
                        Private f32* %212 = OpAccessChain %9 %41 
                                 f32 %213 = OpLoad %212 
                                 f32 %214 = OpFDiv %29 %213 
                        Private f32* %215 = OpAccessChain %9 %41 
                                              OpStore %215 %214 
                        Private f32* %216 = OpAccessChain %9 %41 
                                 f32 %217 = OpLoad %216 
                                 f32 %218 = OpFNegate %217 
                                 f32 %219 = OpFAdd %218 %29 
                        Private f32* %220 = OpAccessChain %9 %41 
                                              OpStore %220 %219 
                               f32_2 %223 = OpLoad %9 
                               f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                               f32_2 %225 = OpLoad %9 
                               f32_3 %226 = OpVectorShuffle %225 %225 0 0 0 
                               f32_3 %227 = OpFAdd %224 %226 
                               f32_4 %228 = OpLoad %222 
                               f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
                                              OpStore %222 %229 
                         Output f32* %232 = OpAccessChain %222 %230 
                                              OpStore %232 %29 
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