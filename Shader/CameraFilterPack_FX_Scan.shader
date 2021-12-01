//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Scan" {
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
  GpuProgramID 28876
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
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat6 = u_xlat0.x + -0.400000006;
    u_xlat9 = _Value2 * _TimeX;
    u_xlat2.x = sin(u_xlat9);
    u_xlat2.x = u_xlat2.x * 0.666666687;
    u_xlatb5 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.x = fract(abs(u_xlat2.x));
    u_xlat2.x = (u_xlatb5) ? u_xlat2.x : (-u_xlat2.x);
    u_xlat6 = u_xlat6 + (-u_xlat2.x);
    u_xlat2.x = u_xlat6 * 4.0 + (-_Value);
    u_xlatb2 = u_xlat1.x<u_xlat2.x;
    if(u_xlatb2){
        SV_Target0 = u_xlat1;
    } else {
        u_xlat6 = u_xlat6 * 4.0 + _Value;
        u_xlatb6 = u_xlat1.x<u_xlat6;
        if(u_xlatb6){
            u_xlat6 = u_xlat9 * 9.0;
            u_xlat6 = sin(u_xlat6);
            u_xlat2.x = u_xlat6 + u_xlat0.x;
            u_xlat2.y = _TimeX * 5.0 + u_xlat0.y;
            u_xlat0 = texture(_MainTex, u_xlat2.xy);
            SV_Target0 = u_xlat0 + vec4(1.0, -1.0, -1.0, 0.0);
        } else {
            SV_Target0 = u_xlat1;
        }
    }
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
; Bound: 171
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %12 %122 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 12 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %33 DescriptorSet 33 
                                                OpDecorate %33 Binding 33 
                                                OpDecorate %37 DescriptorSet 37 
                                                OpDecorate %37 Binding 37 
                                                OpDecorate %122 Location 122 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeVector %6 2 
                                        %11 = OpTypePointer Input %10 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %14 = OpTypeStruct %6 %6 %6 %7 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %7 
                         Private f32_4* %30 = OpVariable Private 
                                        %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %32 = OpTypePointer UniformConstant %31 
   UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                        %35 = OpTypeSampler 
                                        %36 = OpTypePointer UniformConstant %35 
               UniformConstant sampler* %37 = OpVariable UniformConstant 
                                        %39 = OpTypeSampledImage %31 
                                        %44 = OpTypePointer Private %6 
                           Private f32* %45 = OpVariable Private 
                                        %46 = OpTypeInt 32 0 
                                    u32 %47 = OpConstant 0 
                                    f32 %50 = OpConstant 3.674022E-40 
                           Private f32* %52 = OpVariable Private 
                                    i32 %53 = OpConstant 2 
                                        %54 = OpTypePointer Uniform %6 
                                    i32 %57 = OpConstant 0 
                                        %61 = OpTypePointer Private %10 
                         Private f32_2* %62 = OpVariable Private 
                                    f32 %68 = OpConstant 3.674022E-40 
                                        %71 = OpTypeBool 
                                        %72 = OpTypePointer Private %71 
                          Private bool* %73 = OpVariable Private 
                                        %86 = OpTypePointer Function %6 
                                   f32 %104 = OpConstant 3.674022E-40 
                                   i32 %106 = OpConstant 1 
                         Private bool* %112 = OpVariable Private 
                                       %121 = OpTypePointer Output %7 
                         Output f32_4* %122 = OpVariable Output 
                         Private bool* %130 = OpVariable Private 
                                   f32 %139 = OpConstant 3.674022E-40 
                                   f32 %150 = OpConstant 3.674022E-40 
                                   u32 %152 = OpConstant 1 
                                   f32 %163 = OpConstant 3.674022E-40 
                                   f32 %164 = OpConstant 3.674022E-40 
                                   f32 %165 = OpConstant 3.674022E-40 
                                 f32_4 %166 = OpConstantComposite %163 %164 %164 %165 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function f32* %87 = OpVariable Function 
                                  f32_2 %13 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %20 = OpAccessChain %16 %18 
                                  f32_4 %21 = OpLoad %20 
                                  f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                  f32_2 %23 = OpFMul %13 %22 
                         Uniform f32_4* %24 = OpAccessChain %16 %18 
                                  f32_4 %25 = OpLoad %24 
                                  f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                  f32_2 %27 = OpFAdd %23 %26 
                                  f32_4 %28 = OpLoad %9 
                                  f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                OpStore %9 %29 
                    read_only Texture2D %34 = OpLoad %33 
                                sampler %38 = OpLoad %37 
             read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                                  f32_4 %41 = OpLoad %9 
                                  f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                  f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                                                OpStore %30 %43 
                           Private f32* %48 = OpAccessChain %9 %47 
                                    f32 %49 = OpLoad %48 
                                    f32 %51 = OpFAdd %49 %50 
                                                OpStore %45 %51 
                           Uniform f32* %55 = OpAccessChain %16 %53 
                                    f32 %56 = OpLoad %55 
                           Uniform f32* %58 = OpAccessChain %16 %57 
                                    f32 %59 = OpLoad %58 
                                    f32 %60 = OpFMul %56 %59 
                                                OpStore %52 %60 
                                    f32 %63 = OpLoad %52 
                                    f32 %64 = OpExtInst %1 13 %63 
                           Private f32* %65 = OpAccessChain %62 %47 
                                                OpStore %65 %64 
                           Private f32* %66 = OpAccessChain %62 %47 
                                    f32 %67 = OpLoad %66 
                                    f32 %69 = OpFMul %67 %68 
                           Private f32* %70 = OpAccessChain %62 %47 
                                                OpStore %70 %69 
                           Private f32* %74 = OpAccessChain %62 %47 
                                    f32 %75 = OpLoad %74 
                           Private f32* %76 = OpAccessChain %62 %47 
                                    f32 %77 = OpLoad %76 
                                    f32 %78 = OpFNegate %77 
                                   bool %79 = OpFOrdGreaterThanEqual %75 %78 
                                                OpStore %73 %79 
                           Private f32* %80 = OpAccessChain %62 %47 
                                    f32 %81 = OpLoad %80 
                                    f32 %82 = OpExtInst %1 4 %81 
                                    f32 %83 = OpExtInst %1 10 %82 
                           Private f32* %84 = OpAccessChain %62 %47 
                                                OpStore %84 %83 
                                   bool %85 = OpLoad %73 
                                                OpSelectionMerge %89 None 
                                                OpBranchConditional %85 %88 %92 
                                        %88 = OpLabel 
                           Private f32* %90 = OpAccessChain %62 %47 
                                    f32 %91 = OpLoad %90 
                                                OpStore %87 %91 
                                                OpBranch %89 
                                        %92 = OpLabel 
                           Private f32* %93 = OpAccessChain %62 %47 
                                    f32 %94 = OpLoad %93 
                                    f32 %95 = OpFNegate %94 
                                                OpStore %87 %95 
                                                OpBranch %89 
                                        %89 = OpLabel 
                                    f32 %96 = OpLoad %87 
                           Private f32* %97 = OpAccessChain %62 %47 
                                                OpStore %97 %96 
                                    f32 %98 = OpLoad %45 
                           Private f32* %99 = OpAccessChain %62 %47 
                                   f32 %100 = OpLoad %99 
                                   f32 %101 = OpFNegate %100 
                                   f32 %102 = OpFAdd %98 %101 
                                                OpStore %45 %102 
                                   f32 %103 = OpLoad %45 
                                   f32 %105 = OpFMul %103 %104 
                          Uniform f32* %107 = OpAccessChain %16 %106 
                                   f32 %108 = OpLoad %107 
                                   f32 %109 = OpFNegate %108 
                                   f32 %110 = OpFAdd %105 %109 
                          Private f32* %111 = OpAccessChain %62 %47 
                                                OpStore %111 %110 
                          Private f32* %113 = OpAccessChain %30 %47 
                                   f32 %114 = OpLoad %113 
                          Private f32* %115 = OpAccessChain %62 %47 
                                   f32 %116 = OpLoad %115 
                                  bool %117 = OpFOrdLessThan %114 %116 
                                                OpStore %112 %117 
                                  bool %118 = OpLoad %112 
                                                OpSelectionMerge %120 None 
                                                OpBranchConditional %118 %119 %124 
                                       %119 = OpLabel 
                                 f32_4 %123 = OpLoad %30 
                                                OpStore %122 %123 
                                                OpBranch %120 
                                       %124 = OpLabel 
                                   f32 %125 = OpLoad %45 
                                   f32 %126 = OpFMul %125 %104 
                          Uniform f32* %127 = OpAccessChain %16 %106 
                                   f32 %128 = OpLoad %127 
                                   f32 %129 = OpFAdd %126 %128 
                                                OpStore %45 %129 
                          Private f32* %131 = OpAccessChain %30 %47 
                                   f32 %132 = OpLoad %131 
                                   f32 %133 = OpLoad %45 
                                  bool %134 = OpFOrdLessThan %132 %133 
                                                OpStore %130 %134 
                                  bool %135 = OpLoad %130 
                                                OpSelectionMerge %137 None 
                                                OpBranchConditional %135 %136 %168 
                                       %136 = OpLabel 
                                   f32 %138 = OpLoad %52 
                                   f32 %140 = OpFMul %138 %139 
                                                OpStore %45 %140 
                                   f32 %141 = OpLoad %45 
                                   f32 %142 = OpExtInst %1 13 %141 
                                                OpStore %45 %142 
                                   f32 %143 = OpLoad %45 
                          Private f32* %144 = OpAccessChain %9 %47 
                                   f32 %145 = OpLoad %144 
                                   f32 %146 = OpFAdd %143 %145 
                          Private f32* %147 = OpAccessChain %62 %47 
                                                OpStore %147 %146 
                          Uniform f32* %148 = OpAccessChain %16 %57 
                                   f32 %149 = OpLoad %148 
                                   f32 %151 = OpFMul %149 %150 
                          Private f32* %153 = OpAccessChain %9 %152 
                                   f32 %154 = OpLoad %153 
                                   f32 %155 = OpFAdd %151 %154 
                          Private f32* %156 = OpAccessChain %62 %152 
                                                OpStore %156 %155 
                   read_only Texture2D %157 = OpLoad %33 
                               sampler %158 = OpLoad %37 
            read_only Texture2DSampled %159 = OpSampledImage %157 %158 
                                 f32_2 %160 = OpLoad %62 
                                 f32_4 %161 = OpImageSampleImplicitLod %159 %160 
                                                OpStore %9 %161 
                                 f32_4 %162 = OpLoad %9 
                                 f32_4 %167 = OpFAdd %162 %166 
                                                OpStore %122 %167 
                                                OpBranch %137 
                                       %168 = OpLabel 
                                 f32_4 %169 = OpLoad %30 
                                                OpStore %122 %169 
                                                OpBranch %137 
                                       %137 = OpLabel 
                                                OpBranch %120 
                                       %120 = OpLabel 
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