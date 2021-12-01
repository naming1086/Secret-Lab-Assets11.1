//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Distortion_Twist_Square" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
_CenterX ("_CenterX", Range(-1, 1)) = 0
_CenterY ("_CenterY", Range(-1, 1)) = 0
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 18816
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
uniform 	float _Distortion;
uniform 	float _CenterX;
uniform 	float _CenterY;
uniform 	float _Size;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = sin(_Distortion);
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy + (-vec2(_CenterX, _CenterY));
    u_xlat1.xy = u_xlat3.xy * u_xlat3.xy;
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat1.x = _Size * 0.5 + (-u_xlat9);
    u_xlat4 = _Size * 0.5;
    u_xlat1.x = u_xlat1.x / u_xlat4;
    u_xlatb9 = u_xlat9<u_xlat4;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.x = (-u_xlat0.x);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat3.yx, u_xlat2.yz);
    u_xlat1.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat0.xy = (bool(u_xlatb9)) ? u_xlat1.xy : u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(_CenterX, _CenterY);
    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
; Bound: 165
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %26 %151 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpMemberDecorate %11 0 Offset 11 
                                                     OpMemberDecorate %11 1 Offset 11 
                                                     OpMemberDecorate %11 2 Offset 11 
                                                     OpMemberDecorate %11 3 Offset 11 
                                                     OpMemberDecorate %11 4 Offset 11 
                                                     OpDecorate %11 Block 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate vs_TEXCOORD0 Location 26 
                                                     OpDecorate %151 Location 151 
                                                     OpDecorate %154 DescriptorSet 154 
                                                     OpDecorate %154 Binding 154 
                                                     OpDecorate %158 DescriptorSet 158 
                                                     OpDecorate %158 Binding 158 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Private %7 
                               Private f32_2* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 4 
                                             %11 = OpTypeStruct %6 %6 %6 %6 %10 
                                             %12 = OpTypePointer Uniform %11 
Uniform struct {f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
                                             %14 = OpTypeInt 32 1 
                                         i32 %15 = OpConstant 0 
                                             %16 = OpTypePointer Uniform %6 
                                             %20 = OpTypeInt 32 0 
                                         u32 %21 = OpConstant 0 
                                             %22 = OpTypePointer Private %6 
                              Private f32_2* %24 = OpVariable Private 
                                             %25 = OpTypePointer Input %7 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %28 = OpConstant 4 
                                             %29 = OpTypePointer Uniform %10 
                                         i32 %39 = OpConstant 1 
                                         i32 %42 = OpConstant 2 
                              Private f32_2* %48 = OpVariable Private 
                                Private f32* %52 = OpVariable Private 
                                         i32 %58 = OpConstant 3 
                                         f32 %61 = OpConstant 3.674022E-40 
                                Private f32* %67 = OpVariable Private 
                                             %76 = OpTypeBool 
                                             %77 = OpTypePointer Private %76 
                               Private bool* %78 = OpVariable Private 
                                         f32 %96 = OpConstant 3.674022E-40 
                                            %107 = OpTypeVector %6 3 
                                            %108 = OpTypePointer Private %107 
                             Private f32_3* %109 = OpVariable Private 
                                        u32 %116 = OpConstant 1 
                                        u32 %120 = OpConstant 2 
                                            %135 = OpTypePointer Function %7 
                                            %150 = OpTypePointer Output %10 
                              Output f32_4* %151 = OpVariable Output 
                                            %152 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %153 = OpTypePointer UniformConstant %152 
       UniformConstant read_only Texture2D* %154 = OpVariable UniformConstant 
                                            %156 = OpTypeSampler 
                                            %157 = OpTypePointer UniformConstant %156 
                   UniformConstant sampler* %158 = OpVariable UniformConstant 
                                            %160 = OpTypeSampledImage %152 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                            Function f32_2* %136 = OpVariable Function 
                                Uniform f32* %17 = OpAccessChain %13 %15 
                                         f32 %18 = OpLoad %17 
                                         f32 %19 = OpExtInst %1 13 %18 
                                Private f32* %23 = OpAccessChain %9 %21 
                                                     OpStore %23 %19 
                                       f32_2 %27 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %30 = OpAccessChain %13 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                       f32_2 %33 = OpFMul %27 %32 
                              Uniform f32_4* %34 = OpAccessChain %13 %28 
                                       f32_4 %35 = OpLoad %34 
                                       f32_2 %36 = OpVectorShuffle %35 %35 2 3 
                                       f32_2 %37 = OpFAdd %33 %36 
                                                     OpStore %24 %37 
                                       f32_2 %38 = OpLoad %24 
                                Uniform f32* %40 = OpAccessChain %13 %39 
                                         f32 %41 = OpLoad %40 
                                Uniform f32* %43 = OpAccessChain %13 %42 
                                         f32 %44 = OpLoad %43 
                                       f32_2 %45 = OpCompositeConstruct %41 %44 
                                       f32_2 %46 = OpFNegate %45 
                                       f32_2 %47 = OpFAdd %38 %46 
                                                     OpStore %24 %47 
                                       f32_2 %49 = OpLoad %24 
                                       f32_2 %50 = OpLoad %24 
                                       f32_2 %51 = OpFMul %49 %50 
                                                     OpStore %48 %51 
                                       f32_2 %53 = OpLoad %48 
                                       f32_2 %54 = OpLoad %48 
                                         f32 %55 = OpDot %53 %54 
                                                     OpStore %52 %55 
                                         f32 %56 = OpLoad %52 
                                         f32 %57 = OpExtInst %1 31 %56 
                                                     OpStore %52 %57 
                                Uniform f32* %59 = OpAccessChain %13 %58 
                                         f32 %60 = OpLoad %59 
                                         f32 %62 = OpFMul %60 %61 
                                         f32 %63 = OpLoad %52 
                                         f32 %64 = OpFNegate %63 
                                         f32 %65 = OpFAdd %62 %64 
                                Private f32* %66 = OpAccessChain %48 %21 
                                                     OpStore %66 %65 
                                Uniform f32* %68 = OpAccessChain %13 %58 
                                         f32 %69 = OpLoad %68 
                                         f32 %70 = OpFMul %69 %61 
                                                     OpStore %67 %70 
                                Private f32* %71 = OpAccessChain %48 %21 
                                         f32 %72 = OpLoad %71 
                                         f32 %73 = OpLoad %67 
                                         f32 %74 = OpFDiv %72 %73 
                                Private f32* %75 = OpAccessChain %48 %21 
                                                     OpStore %75 %74 
                                         f32 %79 = OpLoad %52 
                                         f32 %80 = OpLoad %67 
                                        bool %81 = OpFOrdLessThan %79 %80 
                                                     OpStore %78 %81 
                                Private f32* %82 = OpAccessChain %48 %21 
                                         f32 %83 = OpLoad %82 
                                Private f32* %84 = OpAccessChain %48 %21 
                                         f32 %85 = OpLoad %84 
                                         f32 %86 = OpFMul %83 %85 
                                Private f32* %87 = OpAccessChain %48 %21 
                                                     OpStore %87 %86 
                                Private f32* %88 = OpAccessChain %9 %21 
                                         f32 %89 = OpLoad %88 
                                Private f32* %90 = OpAccessChain %48 %21 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFMul %89 %91 
                                Private f32* %93 = OpAccessChain %9 %21 
                                                     OpStore %93 %92 
                                Private f32* %94 = OpAccessChain %9 %21 
                                         f32 %95 = OpLoad %94 
                                         f32 %97 = OpFMul %95 %96 
                                Private f32* %98 = OpAccessChain %9 %21 
                                                     OpStore %98 %97 
                                Private f32* %99 = OpAccessChain %9 %21 
                                        f32 %100 = OpLoad %99 
                                        f32 %101 = OpExtInst %1 14 %100 
                               Private f32* %102 = OpAccessChain %48 %21 
                                                     OpStore %102 %101 
                               Private f32* %103 = OpAccessChain %9 %21 
                                        f32 %104 = OpLoad %103 
                                        f32 %105 = OpExtInst %1 13 %104 
                               Private f32* %106 = OpAccessChain %9 %21 
                                                     OpStore %106 %105 
                               Private f32* %110 = OpAccessChain %9 %21 
                                        f32 %111 = OpLoad %110 
                                        f32 %112 = OpFNegate %111 
                               Private f32* %113 = OpAccessChain %109 %21 
                                                     OpStore %113 %112 
                               Private f32* %114 = OpAccessChain %48 %21 
                                        f32 %115 = OpLoad %114 
                               Private f32* %117 = OpAccessChain %109 %116 
                                                     OpStore %117 %115 
                               Private f32* %118 = OpAccessChain %9 %21 
                                        f32 %119 = OpLoad %118 
                               Private f32* %121 = OpAccessChain %109 %120 
                                                     OpStore %121 %119 
                                      f32_2 %122 = OpLoad %24 
                                      f32_2 %123 = OpVectorShuffle %122 %122 1 0 
                                      f32_3 %124 = OpLoad %109 
                                      f32_2 %125 = OpVectorShuffle %124 %124 1 2 
                                        f32 %126 = OpDot %123 %125 
                               Private f32* %127 = OpAccessChain %48 %116 
                                                     OpStore %127 %126 
                                      f32_2 %128 = OpLoad %24 
                                      f32_2 %129 = OpVectorShuffle %128 %128 1 0 
                                      f32_3 %130 = OpLoad %109 
                                      f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                                        f32 %132 = OpDot %129 %131 
                               Private f32* %133 = OpAccessChain %48 %21 
                                                     OpStore %133 %132 
                                       bool %134 = OpLoad %78 
                                                     OpSelectionMerge %138 None 
                                                     OpBranchConditional %134 %137 %140 
                                            %137 = OpLabel 
                                      f32_2 %139 = OpLoad %48 
                                                     OpStore %136 %139 
                                                     OpBranch %138 
                                            %140 = OpLabel 
                                      f32_2 %141 = OpLoad %24 
                                                     OpStore %136 %141 
                                                     OpBranch %138 
                                            %138 = OpLabel 
                                      f32_2 %142 = OpLoad %136 
                                                     OpStore %9 %142 
                                      f32_2 %143 = OpLoad %9 
                               Uniform f32* %144 = OpAccessChain %13 %39 
                                        f32 %145 = OpLoad %144 
                               Uniform f32* %146 = OpAccessChain %13 %42 
                                        f32 %147 = OpLoad %146 
                                      f32_2 %148 = OpCompositeConstruct %145 %147 
                                      f32_2 %149 = OpFAdd %143 %148 
                                                     OpStore %9 %149 
                        read_only Texture2D %155 = OpLoad %154 
                                    sampler %159 = OpLoad %158 
                 read_only Texture2DSampled %161 = OpSampledImage %155 %159 
                                      f32_2 %162 = OpLoad %9 
                                      f32_4 %163 = OpImageSampleImplicitLod %161 %162 
                                                     OpStore %151 %163 
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