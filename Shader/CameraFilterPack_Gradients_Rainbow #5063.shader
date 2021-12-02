//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Gradients_Rainbow" {
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
  GpuProgramID 59434
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
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat4;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat1.x = u_xlat9 * -2.0 + 1.0;
    u_xlat9 = _Value * u_xlat1.x + u_xlat9;
    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
    u_xlatb9 = u_xlat9<0.5;
    u_xlat7 = u_xlat1.y * 2.43902445;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
    u_xlat10 = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat7 * u_xlat10;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
    u_xlat1.x = u_xlat1.x * 1.5;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat2.z = (-u_xlat1.x) + 1.0;
    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
    u_xlat2.x = max(u_xlat4, u_xlat2.z);
    u_xlat2.xyz = u_xlat2.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat0.xyz;
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
; Bound: 191
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %168 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %15 0 Offset 15 
                                             OpMemberDecorate %15 1 Offset 15 
                                             OpMemberDecorate %15 2 Offset 15 
                                             OpDecorate %15 Block 
                                             OpDecorate %17 DescriptorSet 17 
                                             OpDecorate %17 Binding 17 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %37 DescriptorSet 37 
                                             OpDecorate %37 Binding 37 
                                             OpDecorate %168 Location 168 
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
                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %32 = OpTypePointer UniformConstant %31 
UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
                                     %35 = OpTypeSampler 
                                     %36 = OpTypePointer UniformConstant %35 
            UniformConstant sampler* %37 = OpVariable UniformConstant 
                                     %39 = OpTypeSampledImage %31 
                                     %45 = OpTypePointer Private %6 
                        Private f32* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 f32 %50 = OpConstant 3.674022E-40 
                               f32_3 %51 = OpConstantComposite %48 %49 %50 
                      Private f32_3* %53 = OpVariable Private 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %57 = OpConstant 3.674022E-40 
                                     %59 = OpTypeInt 32 0 
                                 u32 %60 = OpConstant 0 
                                 i32 %62 = OpConstant 0 
                                     %63 = OpTypePointer Uniform %6 
                                 f32 %73 = OpConstant 3.674022E-40 
                                 f32 %74 = OpConstant 3.674022E-40 
                               f32_2 %75 = OpConstantComposite %73 %74 
                                     %79 = OpTypeBool 
                                     %80 = OpTypePointer Private %79 
                       Private bool* %81 = OpVariable Private 
                                 f32 %83 = OpConstant 3.674022E-40 
                        Private f32* %85 = OpVariable Private 
                                 u32 %86 = OpConstant 1 
                                 f32 %89 = OpConstant 3.674022E-40 
                                 f32 %92 = OpConstant 3.674022E-40 
                                 f32 %97 = OpConstant 3.674022E-40 
                                 f32 %98 = OpConstant 3.674022E-40 
                               f32_2 %99 = OpConstantComposite %97 %98 
                       Private f32* %103 = OpVariable Private 
                       Private f32* %117 = OpVariable Private 
                                f32 %124 = OpConstant 3.674022E-40 
                                f32 %128 = OpConstant 3.674022E-40 
                     Private f32_3* %135 = OpVariable Private 
                                u32 %140 = OpConstant 2 
                                    %143 = OpTypePointer Function %6 
                                    %167 = OpTypePointer Output %14 
                      Output f32_4* %168 = OpVariable Output 
                                i32 %169 = OpConstant 1 
                                u32 %187 = OpConstant 3 
                                    %188 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Function f32* %144 = OpVariable Function 
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
                 read_only Texture2D %34 = OpLoad %33 
                             sampler %38 = OpLoad %37 
          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
                               f32_3 %41 = OpLoad %9 
                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                               f32_4 %43 = OpImageSampleImplicitLod %40 %42 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                             OpStore %9 %44 
                               f32_3 %47 = OpLoad %9 
                                 f32 %52 = OpDot %47 %51 
                                             OpStore %46 %52 
                                 f32 %54 = OpLoad %46 
                                 f32 %56 = OpFMul %54 %55 
                                 f32 %58 = OpFAdd %56 %57 
                        Private f32* %61 = OpAccessChain %53 %60 
                                             OpStore %61 %58 
                        Uniform f32* %64 = OpAccessChain %17 %62 
                                 f32 %65 = OpLoad %64 
                        Private f32* %66 = OpAccessChain %53 %60 
                                 f32 %67 = OpLoad %66 
                                 f32 %68 = OpFMul %65 %67 
                                 f32 %69 = OpLoad %46 
                                 f32 %70 = OpFAdd %68 %69 
                                             OpStore %46 %70 
                                 f32 %71 = OpLoad %46 
                               f32_2 %72 = OpCompositeConstruct %71 %71 
                               f32_2 %76 = OpFAdd %72 %75 
                               f32_3 %77 = OpLoad %53 
                               f32_3 %78 = OpVectorShuffle %77 %76 3 4 2 
                                             OpStore %53 %78 
                                 f32 %82 = OpLoad %46 
                                bool %84 = OpFOrdLessThan %82 %83 
                                             OpStore %81 %84 
                        Private f32* %87 = OpAccessChain %53 %86 
                                 f32 %88 = OpLoad %87 
                                 f32 %90 = OpFMul %88 %89 
                                             OpStore %85 %90 
                                 f32 %91 = OpLoad %85 
                                 f32 %93 = OpExtInst %1 43 %91 %92 %57 
                                             OpStore %85 %93 
                               f32_3 %94 = OpLoad %53 
                               f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                               f32_2 %96 = OpExtInst %1 4 %95 
                              f32_2 %100 = OpFMul %96 %99 
                              f32_3 %101 = OpLoad %53 
                              f32_3 %102 = OpVectorShuffle %101 %100 3 4 2 
                                             OpStore %53 %102 
                                f32 %104 = OpLoad %85 
                                f32 %105 = OpFMul %104 %55 
                                f32 %106 = OpFAdd %105 %97 
                                             OpStore %103 %106 
                                f32 %107 = OpLoad %85 
                                f32 %108 = OpLoad %85 
                                f32 %109 = OpFMul %107 %108 
                                             OpStore %85 %109 
                                f32 %110 = OpLoad %85 
                                f32 %111 = OpLoad %103 
                                f32 %112 = OpFMul %110 %111 
                                             OpStore %85 %112 
                       Private f32* %113 = OpAccessChain %53 %60 
                                f32 %114 = OpLoad %113 
                                f32 %115 = OpExtInst %1 30 %114 
                       Private f32* %116 = OpAccessChain %53 %60 
                                             OpStore %116 %115 
                       Private f32* %118 = OpAccessChain %53 %86 
                                f32 %119 = OpLoad %118 
                                f32 %120 = OpFNegate %119 
                       Private f32* %121 = OpAccessChain %53 %86 
                                f32 %122 = OpLoad %121 
                                f32 %123 = OpFMul %120 %122 
                                f32 %125 = OpFAdd %123 %124 
                                             OpStore %117 %125 
                       Private f32* %126 = OpAccessChain %53 %60 
                                f32 %127 = OpLoad %126 
                                f32 %129 = OpFMul %127 %128 
                       Private f32* %130 = OpAccessChain %53 %60 
                                             OpStore %130 %129 
                       Private f32* %131 = OpAccessChain %53 %60 
                                f32 %132 = OpLoad %131 
                                f32 %133 = OpExtInst %1 29 %132 
                       Private f32* %134 = OpAccessChain %53 %60 
                                             OpStore %134 %133 
                       Private f32* %136 = OpAccessChain %53 %60 
                                f32 %137 = OpLoad %136 
                                f32 %138 = OpFNegate %137 
                                f32 %139 = OpFAdd %138 %57 
                       Private f32* %141 = OpAccessChain %135 %140 
                                             OpStore %141 %139 
                               bool %142 = OpLoad %81 
                                             OpSelectionMerge %146 None 
                                             OpBranchConditional %142 %145 %148 
                                    %145 = OpLabel 
                                f32 %147 = OpLoad %85 
                                             OpStore %144 %147 
                                             OpBranch %146 
                                    %148 = OpLabel 
                       Private f32* %149 = OpAccessChain %135 %140 
                                f32 %150 = OpLoad %149 
                                             OpStore %144 %150 
                                             OpBranch %146 
                                    %146 = OpLabel 
                                f32 %151 = OpLoad %144 
                       Private f32* %152 = OpAccessChain %135 %86 
                                             OpStore %152 %151 
                                f32 %153 = OpLoad %117 
                       Private f32* %154 = OpAccessChain %135 %140 
                                f32 %155 = OpLoad %154 
                                f32 %156 = OpExtInst %1 40 %153 %155 
                       Private f32* %157 = OpAccessChain %135 %60 
                                             OpStore %157 %156 
                              f32_3 %158 = OpLoad %135 
                                             OpStore %135 %158 
                              f32_3 %159 = OpLoad %135 
                              f32_3 %160 = OpCompositeConstruct %92 %92 %92 
                              f32_3 %161 = OpCompositeConstruct %57 %57 %57 
                              f32_3 %162 = OpExtInst %1 43 %159 %160 %161 
                                             OpStore %135 %162 
                              f32_3 %163 = OpLoad %9 
                              f32_3 %164 = OpFNegate %163 
                              f32_3 %165 = OpLoad %135 
                              f32_3 %166 = OpFAdd %164 %165 
                                             OpStore %53 %166 
                       Uniform f32* %170 = OpAccessChain %17 %169 
                                f32 %171 = OpLoad %170 
                       Uniform f32* %172 = OpAccessChain %17 %169 
                                f32 %173 = OpLoad %172 
                       Uniform f32* %174 = OpAccessChain %17 %169 
                                f32 %175 = OpLoad %174 
                              f32_3 %176 = OpCompositeConstruct %171 %173 %175 
                                f32 %177 = OpCompositeExtract %176 0 
                                f32 %178 = OpCompositeExtract %176 1 
                                f32 %179 = OpCompositeExtract %176 2 
                              f32_3 %180 = OpCompositeConstruct %177 %178 %179 
                              f32_3 %181 = OpLoad %53 
                              f32_3 %182 = OpFMul %180 %181 
                              f32_3 %183 = OpLoad %9 
                              f32_3 %184 = OpFAdd %182 %183 
                              f32_4 %185 = OpLoad %168 
                              f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                             OpStore %168 %186 
                        Output f32* %189 = OpAccessChain %168 %187 
                                             OpStore %189 %57 
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