//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/LUT" {
Properties {
}
SubShader {
 Pass {
  Name "Color Grading LUT"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 16049
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _LUT_Params;
uniform 	float _Invert;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _LUT_Near;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat5;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(_Invert) * u_xlat1 + u_xlat0;
    u_xlat1.xyz = u_xlat0.zxy;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat2.xyz = max(u_xlat1.xyz, vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.x = (u_xlatb1.x) ? u_xlat3.x : u_xlat2.x;
    u_xlat1.y = (u_xlatb1.y) ? u_xlat3.y : u_xlat2.y;
    u_xlat1.z = (u_xlatb1.z) ? u_xlat3.z : u_xlat2.z;
    u_xlat5.xyz = u_xlat1.xyz * _LUT_Params.zzz;
    u_xlat2.xy = _LUT_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat5.yz * _LUT_Params.xy + u_xlat2.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat2.x = u_xlat5.x * _LUT_Params.y + u_xlat2.y;
    u_xlat1.x = u_xlat1.x * _LUT_Params.z + (-u_xlat5.x);
    u_xlat3.x = _LUT_Params.y;
    u_xlat3.y = 0.0;
    u_xlat5.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat2 = texture(_LUT_Near, u_xlat2.xz);
    u_xlat3 = texture(_LUT_Near, u_xlat5.xy);
    u_xlat5.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat2.xyz = max(abs(u_xlat2.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.x = (u_xlatb1.x) ? u_xlat3.x : u_xlat2.x;
    u_xlat1.y = (u_xlatb1.y) ? u_xlat3.y : u_xlat2.y;
    u_xlat1.z = (u_xlatb1.z) ? u_xlat3.z : u_xlat2.z;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = _LUT_Params.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 325
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %307 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate vs_TEXCOORD1 Location 22 
                                              OpMemberDecorate %33 0 Offset 33 
                                              OpMemberDecorate %33 1 Offset 33 
                                              OpDecorate %33 Block 
                                              OpDecorate %35 DescriptorSet 35 
                                              OpDecorate %35 Binding 35 
                                              OpDecorate %203 DescriptorSet 203 
                                              OpDecorate %203 Binding 203 
                                              OpDecorate %205 DescriptorSet 205 
                                              OpDecorate %205 Binding 205 
                                              OpDecorate %307 Location 307 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %11 = OpTypePointer UniformConstant %10 
 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                      %14 = OpTypeSampler 
                                      %15 = OpTypePointer UniformConstant %14 
             UniformConstant sampler* %16 = OpVariable UniformConstant 
                                      %18 = OpTypeSampledImage %10 
                                      %20 = OpTypeVector %6 2 
                                      %21 = OpTypePointer Input %20 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                       Private f32_4* %25 = OpVariable Private 
                                  f32 %27 = OpConstant 3.674022E-40 
                                f32_4 %28 = OpConstantComposite %27 %27 %27 %27 
                                  f32 %30 = OpConstant 3.674022E-40 
                                f32_4 %31 = OpConstantComposite %30 %30 %30 %30 
                                      %33 = OpTypeStruct %7 %6 
                                      %34 = OpTypePointer Uniform %33 
        Uniform struct {f32_4; f32;}* %35 = OpVariable Uniform 
                                      %36 = OpTypeInt 32 1 
                                  i32 %37 = OpConstant 1 
                                      %38 = OpTypePointer Uniform %6 
                                      %46 = OpTypeVector %6 3 
                                  f32 %53 = OpConstant 3.674022E-40 
                                      %59 = OpTypePointer Private %46 
                       Private f32_3* %60 = OpVariable Private 
                                  f32 %63 = OpConstant 3.674022E-40 
                                f32_3 %64 = OpConstantComposite %63 %63 %63 
                                  f32 %69 = OpConstant 3.674022E-40 
                                f32_3 %70 = OpConstantComposite %69 %69 %69 
                                  f32 %75 = OpConstant 3.674022E-40 
                                f32_3 %76 = OpConstantComposite %75 %75 %75 
                                  f32 %78 = OpConstant 3.674022E-40 
                                f32_3 %79 = OpConstantComposite %78 %78 %78 
                       Private f32_3* %81 = OpVariable Private 
                                  f32 %84 = OpConstant 3.674022E-40 
                                f32_3 %85 = OpConstantComposite %84 %84 %84 
                                      %87 = OpTypeBool 
                                      %88 = OpTypeVector %87 3 
                                      %89 = OpTypePointer Private %88 
                      Private bool_3* %90 = OpVariable Private 
                                  f32 %91 = OpConstant 3.674022E-40 
                                f32_4 %92 = OpConstantComposite %91 %91 %91 %53 
                                      %95 = OpTypeVector %87 4 
                                      %98 = OpTypeInt 32 0 
                                  u32 %99 = OpConstant 0 
                                     %100 = OpTypePointer Private %87 
                                     %103 = OpTypePointer Function %6 
                                     %107 = OpTypePointer Private %6 
                                 u32 %115 = OpConstant 1 
                                 u32 %128 = OpConstant 2 
                      Private f32_3* %141 = OpVariable Private 
                                 i32 %144 = OpConstant 0 
                                     %145 = OpTypePointer Uniform %7 
                                 f32 %153 = OpConstant 3.674022E-40 
                               f32_2 %154 = OpConstantComposite %153 %153 
UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
            UniformConstant sampler* %205 = OpVariable UniformConstant 
                                 f32 %233 = OpConstant 3.674022E-40 
                               f32_3 %234 = OpConstantComposite %233 %233 %233 
                                 f32 %237 = OpConstant 3.674022E-40 
                               f32_3 %238 = OpConstantComposite %237 %237 %237 
                                 f32 %246 = OpConstant 3.674022E-40 
                               f32_3 %247 = OpConstantComposite %246 %246 %246 
                                 f32 %253 = OpConstant 3.674022E-40 
                               f32_3 %254 = OpConstantComposite %253 %253 %253 
                                 f32 %256 = OpConstant 3.674022E-40 
                               f32_4 %257 = OpConstantComposite %256 %256 %256 %53 
                                     %306 = OpTypePointer Output %7 
                       Output f32_4* %307 = OpVariable Output 
                                 u32 %319 = OpConstant 3 
                                     %322 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %104 = OpVariable Function 
                       Function f32* %118 = OpVariable Function 
                       Function f32* %131 = OpVariable Function 
                       Function f32* %264 = OpVariable Function 
                       Function f32* %276 = OpVariable Function 
                       Function f32* %288 = OpVariable Function 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD1 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                              OpStore %9 %24 
                                f32_4 %26 = OpLoad %9 
                                f32_4 %29 = OpFMul %26 %28 
                                f32_4 %32 = OpFAdd %29 %31 
                                              OpStore %25 %32 
                         Uniform f32* %39 = OpAccessChain %35 %37 
                                  f32 %40 = OpLoad %39 
                                f32_4 %41 = OpCompositeConstruct %40 %40 %40 %40 
                                f32_4 %42 = OpLoad %25 
                                f32_4 %43 = OpFMul %41 %42 
                                f32_4 %44 = OpLoad %9 
                                f32_4 %45 = OpFAdd %43 %44 
                                              OpStore %9 %45 
                                f32_4 %47 = OpLoad %9 
                                f32_3 %48 = OpVectorShuffle %47 %47 2 0 1 
                                f32_4 %49 = OpLoad %25 
                                f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                              OpStore %25 %50 
                                f32_4 %51 = OpLoad %25 
                                f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                f32_3 %54 = OpCompositeConstruct %53 %53 %53 
                                f32_3 %55 = OpCompositeConstruct %30 %30 %30 
                                f32_3 %56 = OpExtInst %1 43 %52 %54 %55 
                                f32_4 %57 = OpLoad %25 
                                f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                              OpStore %25 %58 
                                f32_4 %61 = OpLoad %25 
                                f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                f32_3 %65 = OpExtInst %1 40 %62 %64 
                                              OpStore %60 %65 
                                f32_3 %66 = OpLoad %60 
                                f32_3 %67 = OpExtInst %1 30 %66 
                                              OpStore %60 %67 
                                f32_3 %68 = OpLoad %60 
                                f32_3 %71 = OpFMul %68 %70 
                                              OpStore %60 %71 
                                f32_3 %72 = OpLoad %60 
                                f32_3 %73 = OpExtInst %1 29 %72 
                                              OpStore %60 %73 
                                f32_3 %74 = OpLoad %60 
                                f32_3 %77 = OpFMul %74 %76 
                                f32_3 %80 = OpFAdd %77 %79 
                                              OpStore %60 %80 
                                f32_4 %82 = OpLoad %25 
                                f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                f32_3 %86 = OpFMul %83 %85 
                                              OpStore %81 %86 
                                f32_4 %93 = OpLoad %25 
                                f32_4 %94 = OpVectorShuffle %93 %93 0 1 2 0 
                               bool_4 %96 = OpFOrdGreaterThanEqual %92 %94 
                               bool_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                              OpStore %90 %97 
                       Private bool* %101 = OpAccessChain %90 %99 
                                bool %102 = OpLoad %101 
                                              OpSelectionMerge %106 None 
                                              OpBranchConditional %102 %105 %110 
                                     %105 = OpLabel 
                        Private f32* %108 = OpAccessChain %81 %99 
                                 f32 %109 = OpLoad %108 
                                              OpStore %104 %109 
                                              OpBranch %106 
                                     %110 = OpLabel 
                        Private f32* %111 = OpAccessChain %60 %99 
                                 f32 %112 = OpLoad %111 
                                              OpStore %104 %112 
                                              OpBranch %106 
                                     %106 = OpLabel 
                                 f32 %113 = OpLoad %104 
                        Private f32* %114 = OpAccessChain %25 %99 
                                              OpStore %114 %113 
                       Private bool* %116 = OpAccessChain %90 %115 
                                bool %117 = OpLoad %116 
                                              OpSelectionMerge %120 None 
                                              OpBranchConditional %117 %119 %123 
                                     %119 = OpLabel 
                        Private f32* %121 = OpAccessChain %81 %115 
                                 f32 %122 = OpLoad %121 
                                              OpStore %118 %122 
                                              OpBranch %120 
                                     %123 = OpLabel 
                        Private f32* %124 = OpAccessChain %60 %115 
                                 f32 %125 = OpLoad %124 
                                              OpStore %118 %125 
                                              OpBranch %120 
                                     %120 = OpLabel 
                                 f32 %126 = OpLoad %118 
                        Private f32* %127 = OpAccessChain %25 %115 
                                              OpStore %127 %126 
                       Private bool* %129 = OpAccessChain %90 %128 
                                bool %130 = OpLoad %129 
                                              OpSelectionMerge %133 None 
                                              OpBranchConditional %130 %132 %136 
                                     %132 = OpLabel 
                        Private f32* %134 = OpAccessChain %81 %128 
                                 f32 %135 = OpLoad %134 
                                              OpStore %131 %135 
                                              OpBranch %133 
                                     %136 = OpLabel 
                        Private f32* %137 = OpAccessChain %60 %128 
                                 f32 %138 = OpLoad %137 
                                              OpStore %131 %138 
                                              OpBranch %133 
                                     %133 = OpLabel 
                                 f32 %139 = OpLoad %131 
                        Private f32* %140 = OpAccessChain %25 %128 
                                              OpStore %140 %139 
                               f32_4 %142 = OpLoad %25 
                               f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                      Uniform f32_4* %146 = OpAccessChain %35 %144 
                               f32_4 %147 = OpLoad %146 
                               f32_3 %148 = OpVectorShuffle %147 %147 2 2 2 
                               f32_3 %149 = OpFMul %143 %148 
                                              OpStore %141 %149 
                      Uniform f32_4* %150 = OpAccessChain %35 %144 
                               f32_4 %151 = OpLoad %150 
                               f32_2 %152 = OpVectorShuffle %151 %151 0 1 
                               f32_2 %155 = OpFMul %152 %154 
                               f32_3 %156 = OpLoad %60 
                               f32_3 %157 = OpVectorShuffle %156 %155 3 4 2 
                                              OpStore %60 %157 
                               f32_3 %158 = OpLoad %141 
                               f32_2 %159 = OpVectorShuffle %158 %158 1 2 
                      Uniform f32_4* %160 = OpAccessChain %35 %144 
                               f32_4 %161 = OpLoad %160 
                               f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                               f32_2 %163 = OpFMul %159 %162 
                               f32_3 %164 = OpLoad %60 
                               f32_2 %165 = OpVectorShuffle %164 %164 0 1 
                               f32_2 %166 = OpFAdd %163 %165 
                               f32_3 %167 = OpLoad %60 
                               f32_3 %168 = OpVectorShuffle %167 %166 0 3 4 
                                              OpStore %60 %168 
                        Private f32* %169 = OpAccessChain %141 %99 
                                 f32 %170 = OpLoad %169 
                                 f32 %171 = OpExtInst %1 8 %170 
                        Private f32* %172 = OpAccessChain %141 %99 
                                              OpStore %172 %171 
                        Private f32* %173 = OpAccessChain %141 %99 
                                 f32 %174 = OpLoad %173 
                        Uniform f32* %175 = OpAccessChain %35 %144 %115 
                                 f32 %176 = OpLoad %175 
                                 f32 %177 = OpFMul %174 %176 
                        Private f32* %178 = OpAccessChain %60 %115 
                                 f32 %179 = OpLoad %178 
                                 f32 %180 = OpFAdd %177 %179 
                        Private f32* %181 = OpAccessChain %60 %99 
                                              OpStore %181 %180 
                        Private f32* %182 = OpAccessChain %25 %99 
                                 f32 %183 = OpLoad %182 
                        Uniform f32* %184 = OpAccessChain %35 %144 %128 
                                 f32 %185 = OpLoad %184 
                                 f32 %186 = OpFMul %183 %185 
                        Private f32* %187 = OpAccessChain %141 %99 
                                 f32 %188 = OpLoad %187 
                                 f32 %189 = OpFNegate %188 
                                 f32 %190 = OpFAdd %186 %189 
                        Private f32* %191 = OpAccessChain %25 %99 
                                              OpStore %191 %190 
                        Uniform f32* %192 = OpAccessChain %35 %144 %115 
                                 f32 %193 = OpLoad %192 
                        Private f32* %194 = OpAccessChain %81 %99 
                                              OpStore %194 %193 
                        Private f32* %195 = OpAccessChain %81 %115 
                                              OpStore %195 %53 
                               f32_3 %196 = OpLoad %60 
                               f32_2 %197 = OpVectorShuffle %196 %196 0 2 
                               f32_3 %198 = OpLoad %81 
                               f32_2 %199 = OpVectorShuffle %198 %198 0 1 
                               f32_2 %200 = OpFAdd %197 %199 
                               f32_3 %201 = OpLoad %141 
                               f32_3 %202 = OpVectorShuffle %201 %200 3 4 2 
                                              OpStore %141 %202 
                 read_only Texture2D %204 = OpLoad %203 
                             sampler %206 = OpLoad %205 
          read_only Texture2DSampled %207 = OpSampledImage %204 %206 
                               f32_3 %208 = OpLoad %60 
                               f32_2 %209 = OpVectorShuffle %208 %208 0 2 
                               f32_4 %210 = OpImageSampleImplicitLod %207 %209 
                               f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                              OpStore %60 %211 
                 read_only Texture2D %212 = OpLoad %203 
                             sampler %213 = OpLoad %205 
          read_only Texture2DSampled %214 = OpSampledImage %212 %213 
                               f32_3 %215 = OpLoad %141 
                               f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                               f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                               f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                              OpStore %141 %218 
                               f32_3 %219 = OpLoad %60 
                               f32_3 %220 = OpFNegate %219 
                               f32_3 %221 = OpLoad %141 
                               f32_3 %222 = OpFAdd %220 %221 
                                              OpStore %141 %222 
                               f32_4 %223 = OpLoad %25 
                               f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
                               f32_3 %225 = OpLoad %141 
                               f32_3 %226 = OpFMul %224 %225 
                               f32_3 %227 = OpLoad %60 
                               f32_3 %228 = OpFAdd %226 %227 
                               f32_4 %229 = OpLoad %25 
                               f32_4 %230 = OpVectorShuffle %229 %228 4 5 6 3 
                                              OpStore %25 %230 
                               f32_4 %231 = OpLoad %25 
                               f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                               f32_3 %235 = OpFAdd %232 %234 
                                              OpStore %60 %235 
                               f32_3 %236 = OpLoad %60 
                               f32_3 %239 = OpFMul %236 %238 
                                              OpStore %60 %239 
                               f32_3 %240 = OpLoad %60 
                               f32_3 %241 = OpExtInst %1 4 %240 
                               f32_3 %242 = OpExtInst %1 40 %241 %64 
                                              OpStore %60 %242 
                               f32_3 %243 = OpLoad %60 
                               f32_3 %244 = OpExtInst %1 30 %243 
                                              OpStore %60 %244 
                               f32_3 %245 = OpLoad %60 
                               f32_3 %248 = OpFMul %245 %247 
                                              OpStore %60 %248 
                               f32_3 %249 = OpLoad %60 
                               f32_3 %250 = OpExtInst %1 29 %249 
                                              OpStore %60 %250 
                               f32_4 %251 = OpLoad %25 
                               f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                               f32_3 %255 = OpFMul %252 %254 
                                              OpStore %81 %255 
                               f32_4 %258 = OpLoad %25 
                               f32_4 %259 = OpVectorShuffle %258 %258 0 1 2 0 
                              bool_4 %260 = OpFOrdGreaterThanEqual %257 %259 
                              bool_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                              OpStore %90 %261 
                       Private bool* %262 = OpAccessChain %90 %99 
                                bool %263 = OpLoad %262 
                                              OpSelectionMerge %266 None 
                                              OpBranchConditional %263 %265 %269 
                                     %265 = OpLabel 
                        Private f32* %267 = OpAccessChain %81 %99 
                                 f32 %268 = OpLoad %267 
                                              OpStore %264 %268 
                                              OpBranch %266 
                                     %269 = OpLabel 
                        Private f32* %270 = OpAccessChain %60 %99 
                                 f32 %271 = OpLoad %270 
                                              OpStore %264 %271 
                                              OpBranch %266 
                                     %266 = OpLabel 
                                 f32 %272 = OpLoad %264 
                        Private f32* %273 = OpAccessChain %25 %99 
                                              OpStore %273 %272 
                       Private bool* %274 = OpAccessChain %90 %115 
                                bool %275 = OpLoad %274 
                                              OpSelectionMerge %278 None 
                                              OpBranchConditional %275 %277 %281 
                                     %277 = OpLabel 
                        Private f32* %279 = OpAccessChain %81 %115 
                                 f32 %280 = OpLoad %279 
                                              OpStore %276 %280 
                                              OpBranch %278 
                                     %281 = OpLabel 
                        Private f32* %282 = OpAccessChain %60 %115 
                                 f32 %283 = OpLoad %282 
                                              OpStore %276 %283 
                                              OpBranch %278 
                                     %278 = OpLabel 
                                 f32 %284 = OpLoad %276 
                        Private f32* %285 = OpAccessChain %25 %115 
                                              OpStore %285 %284 
                       Private bool* %286 = OpAccessChain %90 %128 
                                bool %287 = OpLoad %286 
                                              OpSelectionMerge %290 None 
                                              OpBranchConditional %287 %289 %293 
                                     %289 = OpLabel 
                        Private f32* %291 = OpAccessChain %81 %128 
                                 f32 %292 = OpLoad %291 
                                              OpStore %288 %292 
                                              OpBranch %290 
                                     %293 = OpLabel 
                        Private f32* %294 = OpAccessChain %60 %128 
                                 f32 %295 = OpLoad %294 
                                              OpStore %288 %295 
                                              OpBranch %290 
                                     %290 = OpLabel 
                                 f32 %296 = OpLoad %288 
                        Private f32* %297 = OpAccessChain %25 %128 
                                              OpStore %297 %296 
                               f32_4 %298 = OpLoad %9 
                               f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                               f32_3 %300 = OpFNegate %299 
                               f32_4 %301 = OpLoad %25 
                               f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                               f32_3 %303 = OpFAdd %300 %302 
                               f32_4 %304 = OpLoad %25 
                               f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                              OpStore %25 %305 
                      Uniform f32_4* %308 = OpAccessChain %35 %144 
                               f32_4 %309 = OpLoad %308 
                               f32_3 %310 = OpVectorShuffle %309 %309 3 3 3 
                               f32_4 %311 = OpLoad %25 
                               f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                               f32_3 %313 = OpFMul %310 %312 
                               f32_4 %314 = OpLoad %9 
                               f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                               f32_3 %316 = OpFAdd %313 %315 
                               f32_4 %317 = OpLoad %307 
                               f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
                                              OpStore %307 %318 
                        Private f32* %320 = OpAccessChain %9 %319 
                                 f32 %321 = OpLoad %320 
                         Output f32* %323 = OpAccessChain %307 %319 
                                              OpStore %323 %321 
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
  Name "Dual Color Grading LUT"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 128436
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _LUT_Params;
uniform 	vec4 _FadeParams;
uniform 	float _Invert;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform  sampler2D _LUT_Near;
UNITY_LOCATION(3) uniform  sampler2D _LUT_Far;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec2 u_xlat14;
void main()
{
    u_xlat0.x = (-unity_OrthoParams.w) + 1.0;
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat7.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + _ZBufferParams.y;
    u_xlat7.x = (-unity_OrthoParams.w) * u_xlat7.x + 1.0;
    u_xlat0.x = u_xlat7.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat7.x = (-u_xlat0.x) + 1.0;
    u_xlat7.x = _ZBufferParams.z * u_xlat7.x + _ZBufferParams.w;
    u_xlat7.x = (-u_xlat7.x) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = unity_OrthoParams.w * u_xlat7.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + _FadeParams.y;
    u_xlat7.x = (-_FadeParams.x) + _FadeParams.y;
    u_xlat0.x = u_xlat0.x / u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = _LUT_Params.y;
    u_xlat1.y = 0.0;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat3 = u_xlat2 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(_Invert) * u_xlat3 + u_xlat2;
    u_xlat7.xyz = u_xlat2.zxy;
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat3.xyz = max(u_xlat7.xyz, vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = u_xlat7.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb7.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.00313080009), u_xlat7.xyzz).xyz;
    u_xlat7.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat3.x;
    u_xlat7.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat3.y;
    u_xlat7.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat3.z;
    u_xlat3.xyz = u_xlat7.xyz * _LUT_Params.zzz;
    u_xlat14.xy = _LUT_Params.xy * vec2(0.5, 0.5);
    u_xlat4.yz = u_xlat3.yz * _LUT_Params.xy + u_xlat14.xy;
    u_xlat14.x = floor(u_xlat3.x);
    u_xlat4.x = u_xlat14.x * _LUT_Params.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x * _LUT_Params.z + (-u_xlat14.x);
    u_xlat14.xy = u_xlat1.xy + u_xlat4.xz;
    u_xlat1 = texture(_LUT_Near, u_xlat14.xy);
    u_xlat3 = texture(_LUT_Far, u_xlat14.xy);
    u_xlat5 = texture(_LUT_Near, u_xlat4.xz);
    u_xlat4 = texture(_LUT_Far, u_xlat4.xz);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat5.xyz);
    u_xlat1.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat1.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat5.xyz = u_xlat5.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat5.xyz = max(abs(u_xlat5.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat5.xyz = log2(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat5.xyz = exp2(u_xlat5.xyz);
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat1.xyzx).xyz;
    u_xlat1.x = (u_xlatb1.x) ? u_xlat6.x : u_xlat5.x;
    u_xlat1.y = (u_xlatb1.y) ? u_xlat6.y : u_xlat5.y;
    u_xlat1.z = (u_xlatb1.z) ? u_xlat6.z : u_xlat5.z;
    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat3.xyz = max(abs(u_xlat3.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat4.xyz = u_xlat7.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb7.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0404499993), u_xlat7.xyzz).xyz;
    u_xlat7.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat3.x;
    u_xlat7.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat3.y;
    u_xlat7.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat3.z;
    u_xlat1.xyz = (-u_xlat7.xyz) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = vec3(_Invert) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat2.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = _LUT_Params.www * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 572
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %40 %556 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate vs_TEXCOORD1 Location 40 
                                                      OpDecorate %162 DescriptorSet 162 
                                                      OpDecorate %162 Binding 162 
                                                      OpDecorate %164 DescriptorSet 164 
                                                      OpDecorate %164 Binding 164 
                                                      OpDecorate %331 DescriptorSet 331 
                                                      OpDecorate %331 Binding 331 
                                                      OpDecorate %333 DescriptorSet 333 
                                                      OpDecorate %333 Binding 333 
                                                      OpDecorate %339 DescriptorSet 339 
                                                      OpDecorate %339 Binding 339 
                                                      OpDecorate %341 DescriptorSet 341 
                                                      OpDecorate %341 Binding 341 
                                                      OpDecorate %556 Location 556 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %10 %10 %10 %10 %10 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Uniform %6 
                                          f32 %22 = OpConstant 3.674022E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                               Private f32_3* %27 = OpVariable Private 
                                              %28 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %29 = OpTypePointer UniformConstant %28 
         UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
                                              %32 = OpTypeSampler 
                                              %33 = OpTypePointer UniformConstant %32 
                     UniformConstant sampler* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampledImage %28 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Input %38 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          i32 %47 = OpConstant 2 
                                          u32 %57 = OpConstant 1 
                                          i32 %78 = OpConstant 0 
                                          u32 %79 = OpConstant 2 
                                         i32 %131 = OpConstant 4 
                                         f32 %151 = OpConstant 3.674022E-40 
                              Private f32_3* %154 = OpVariable Private 
                                         i32 %155 = OpConstant 3 
                                             %160 = OpTypePointer Private %10 
                              Private f32_4* %161 = OpVariable Private 
        UniformConstant read_only Texture2D* %162 = OpVariable UniformConstant 
                    UniformConstant sampler* %164 = OpVariable UniformConstant 
                              Private f32_4* %169 = OpVariable Private 
                                         f32 %171 = OpConstant 3.674022E-40 
                                       f32_4 %172 = OpConstantComposite %171 %171 %171 %171 
                                       f32_4 %174 = OpConstantComposite %22 %22 %22 %22 
                                         i32 %176 = OpConstant 5 
                                         f32 %191 = OpConstant 3.674022E-40 
                                       f32_3 %192 = OpConstantComposite %191 %191 %191 
                                         f32 %203 = OpConstant 3.674022E-40 
                                       f32_3 %204 = OpConstantComposite %203 %203 %203 
                                         f32 %215 = OpConstant 3.674022E-40 
                                       f32_3 %216 = OpConstantComposite %215 %215 %215 
                                         f32 %218 = OpConstant 3.674022E-40 
                                       f32_3 %219 = OpConstantComposite %218 %218 %218 
                              Private f32_3* %223 = OpVariable Private 
                                         f32 %225 = OpConstant 3.674022E-40 
                                       f32_3 %226 = OpConstantComposite %225 %225 %225 
                                             %228 = OpTypeBool 
                                             %229 = OpTypeVector %228 3 
                                             %230 = OpTypePointer Private %229 
                             Private bool_3* %231 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_4 %233 = OpConstantComposite %232 %232 %232 %232 
                                             %236 = OpTypeVector %228 4 
                                             %239 = OpTypePointer Private %228 
                                             %242 = OpTypePointer Function %6 
                                             %278 = OpTypePointer Uniform %10 
                                             %285 = OpTypePointer Private %38 
                              Private f32_2* %286 = OpVariable Private 
                                         f32 %290 = OpConstant 3.674022E-40 
                                       f32_2 %291 = OpConstantComposite %290 %290 
        UniformConstant read_only Texture2D* %331 = OpVariable UniformConstant 
                    UniformConstant sampler* %333 = OpVariable UniformConstant 
        UniformConstant read_only Texture2D* %339 = OpVariable UniformConstant 
                    UniformConstant sampler* %341 = OpVariable UniformConstant 
                              Private f32_3* %349 = OpVariable Private 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_3 %376 = OpConstantComposite %375 %375 %375 
                                         f32 %379 = OpConstant 3.674022E-40 
                                       f32_3 %380 = OpConstantComposite %379 %379 %379 
                                         f32 %388 = OpConstant 3.674022E-40 
                                       f32_3 %389 = OpConstantComposite %388 %388 %388 
                              Private f32_3* %393 = OpVariable Private 
                                         f32 %395 = OpConstant 3.674022E-40 
                                       f32_3 %396 = OpConstantComposite %395 %395 %395 
                             Private bool_3* %398 = OpVariable Private 
                                         f32 %399 = OpConstant 3.674022E-40 
                                       f32_4 %400 = OpConstantComposite %399 %399 %399 %151 
                                       f32_4 %487 = OpConstantComposite %399 %399 %399 %399 
                                       f32_3 %539 = OpConstantComposite %171 %171 %171 
                                       f32_3 %541 = OpConstantComposite %22 %22 %22 
                                             %555 = OpTypePointer Output %10 
                               Output f32_4* %556 = OpVariable Output 
                                             %569 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %243 = OpVariable Function 
                               Function f32* %255 = OpVariable Function 
                               Function f32* %267 = OpVariable Function 
                               Function f32* %407 = OpVariable Function 
                               Function f32* %419 = OpVariable Function 
                               Function f32* %431 = OpVariable Function 
                               Function f32* %494 = OpVariable Function 
                               Function f32* %506 = OpVariable Function 
                               Function f32* %518 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFNegate %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                          read_only Texture2D %31 = OpLoad %30 
                                      sampler %35 = OpLoad %34 
                   read_only Texture2DSampled %37 = OpSampledImage %31 %35 
                                        f32_2 %41 = OpLoad vs_TEXCOORD1 
                                        f32_4 %42 = OpImageSampleImplicitLod %37 %41 
                                          f32 %43 = OpCompositeExtract %42 0 
                                 Private f32* %44 = OpAccessChain %27 %24 
                                                      OpStore %44 %43 
                                 Private f32* %45 = OpAccessChain %27 %24 
                                          f32 %46 = OpLoad %45 
                                 Uniform f32* %48 = OpAccessChain %13 %47 %24 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFMul %46 %49 
                                 Private f32* %51 = OpAccessChain %27 %24 
                                                      OpStore %51 %50 
                                 Private f32* %52 = OpAccessChain %9 %24 
                                          f32 %53 = OpLoad %52 
                                 Private f32* %54 = OpAccessChain %27 %24 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpFMul %53 %55 
                                 Uniform f32* %58 = OpAccessChain %13 %47 %57 
                                          f32 %59 = OpLoad %58 
                                          f32 %60 = OpFAdd %56 %59 
                                 Private f32* %61 = OpAccessChain %9 %24 
                                                      OpStore %61 %60 
                                 Uniform f32* %62 = OpAccessChain %13 %15 %17 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFNegate %63 
                                 Private f32* %65 = OpAccessChain %27 %24 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %64 %66 
                                          f32 %68 = OpFAdd %67 %22 
                                 Private f32* %69 = OpAccessChain %27 %24 
                                                      OpStore %69 %68 
                                 Private f32* %70 = OpAccessChain %27 %24 
                                          f32 %71 = OpLoad %70 
                                 Private f32* %72 = OpAccessChain %9 %24 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFDiv %71 %73 
                                 Private f32* %75 = OpAccessChain %9 %24 
                                                      OpStore %75 %74 
                                 Private f32* %76 = OpAccessChain %9 %24 
                                          f32 %77 = OpLoad %76 
                                 Uniform f32* %80 = OpAccessChain %13 %78 %79 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFMul %77 %81 
                                 Uniform f32* %83 = OpAccessChain %13 %78 %57 
                                          f32 %84 = OpLoad %83 
                                          f32 %85 = OpFNegate %84 
                                          f32 %86 = OpFAdd %82 %85 
                                 Private f32* %87 = OpAccessChain %9 %24 
                                                      OpStore %87 %86 
                                 Private f32* %88 = OpAccessChain %9 %24 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %90 %22 
                                 Private f32* %92 = OpAccessChain %27 %24 
                                                      OpStore %92 %91 
                                 Uniform f32* %93 = OpAccessChain %13 %47 %79 
                                          f32 %94 = OpLoad %93 
                                 Private f32* %95 = OpAccessChain %27 %24 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFMul %94 %96 
                                 Uniform f32* %98 = OpAccessChain %13 %47 %17 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFAdd %97 %99 
                                Private f32* %101 = OpAccessChain %27 %24 
                                                      OpStore %101 %100 
                                Private f32* %102 = OpAccessChain %27 %24 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                Uniform f32* %105 = OpAccessChain %13 %78 %17 
                                         f32 %106 = OpLoad %105 
                                         f32 %107 = OpFMul %104 %106 
                                Uniform f32* %108 = OpAccessChain %13 %78 %79 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFAdd %107 %109 
                                Private f32* %111 = OpAccessChain %27 %24 
                                                      OpStore %111 %110 
                                Private f32* %112 = OpAccessChain %9 %24 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFNegate %113 
                                Private f32* %115 = OpAccessChain %27 %24 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %114 %116 
                                Private f32* %118 = OpAccessChain %27 %24 
                                                      OpStore %118 %117 
                                Uniform f32* %119 = OpAccessChain %13 %15 %17 
                                         f32 %120 = OpLoad %119 
                                Private f32* %121 = OpAccessChain %27 %24 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFMul %120 %122 
                                Private f32* %124 = OpAccessChain %9 %24 
                                         f32 %125 = OpLoad %124 
                                         f32 %126 = OpFAdd %123 %125 
                                Private f32* %127 = OpAccessChain %9 %24 
                                                      OpStore %127 %126 
                                Private f32* %128 = OpAccessChain %9 %24 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFNegate %129 
                                Uniform f32* %132 = OpAccessChain %13 %131 %57 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %130 %133 
                                Private f32* %135 = OpAccessChain %9 %24 
                                                      OpStore %135 %134 
                                Uniform f32* %136 = OpAccessChain %13 %131 %24 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFNegate %137 
                                Uniform f32* %139 = OpAccessChain %13 %131 %57 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFAdd %138 %140 
                                Private f32* %142 = OpAccessChain %27 %24 
                                                      OpStore %142 %141 
                                Private f32* %143 = OpAccessChain %9 %24 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %27 %24 
                                         f32 %146 = OpLoad %145 
                                         f32 %147 = OpFDiv %144 %146 
                                Private f32* %148 = OpAccessChain %9 %24 
                                                      OpStore %148 %147 
                                Private f32* %149 = OpAccessChain %9 %24 
                                         f32 %150 = OpLoad %149 
                                         f32 %152 = OpExtInst %1 43 %150 %151 %22 
                                Private f32* %153 = OpAccessChain %9 %24 
                                                      OpStore %153 %152 
                                Uniform f32* %156 = OpAccessChain %13 %155 %57 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %154 %24 
                                                      OpStore %158 %157 
                                Private f32* %159 = OpAccessChain %154 %57 
                                                      OpStore %159 %151 
                         read_only Texture2D %163 = OpLoad %162 
                                     sampler %165 = OpLoad %164 
                  read_only Texture2DSampled %166 = OpSampledImage %163 %165 
                                       f32_2 %167 = OpLoad vs_TEXCOORD1 
                                       f32_4 %168 = OpImageSampleImplicitLod %166 %167 
                                                      OpStore %161 %168 
                                       f32_4 %170 = OpLoad %161 
                                       f32_4 %173 = OpFMul %170 %172 
                                       f32_4 %175 = OpFAdd %173 %174 
                                                      OpStore %169 %175 
                                Uniform f32* %177 = OpAccessChain %13 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_4 %179 = OpCompositeConstruct %178 %178 %178 %178 
                                       f32_4 %180 = OpLoad %169 
                                       f32_4 %181 = OpFMul %179 %180 
                                       f32_4 %182 = OpLoad %161 
                                       f32_4 %183 = OpFAdd %181 %182 
                                                      OpStore %161 %183 
                                       f32_4 %184 = OpLoad %161 
                                       f32_3 %185 = OpVectorShuffle %184 %184 2 0 1 
                                                      OpStore %27 %185 
                                       f32_3 %186 = OpLoad %27 
                                       f32_3 %187 = OpCompositeConstruct %151 %151 %151 
                                       f32_3 %188 = OpCompositeConstruct %22 %22 %22 
                                       f32_3 %189 = OpExtInst %1 43 %186 %187 %188 
                                                      OpStore %27 %189 
                                       f32_3 %190 = OpLoad %27 
                                       f32_3 %193 = OpExtInst %1 40 %190 %192 
                                       f32_4 %194 = OpLoad %169 
                                       f32_4 %195 = OpVectorShuffle %194 %193 4 5 6 3 
                                                      OpStore %169 %195 
                                       f32_4 %196 = OpLoad %169 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpExtInst %1 30 %197 
                                       f32_4 %199 = OpLoad %169 
                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
                                                      OpStore %169 %200 
                                       f32_4 %201 = OpLoad %169 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %169 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %169 %207 
                                       f32_4 %208 = OpLoad %169 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpExtInst %1 29 %209 
                                       f32_4 %211 = OpLoad %169 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
                                                      OpStore %169 %212 
                                       f32_4 %213 = OpLoad %169 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                       f32_3 %217 = OpFMul %214 %216 
                                       f32_3 %220 = OpFAdd %217 %219 
                                       f32_4 %221 = OpLoad %169 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                      OpStore %169 %222 
                                       f32_3 %224 = OpLoad %27 
                                       f32_3 %227 = OpFMul %224 %226 
                                                      OpStore %223 %227 
                                       f32_3 %234 = OpLoad %27 
                                       f32_4 %235 = OpVectorShuffle %234 %234 0 1 2 2 
                                      bool_4 %237 = OpFOrdGreaterThanEqual %233 %235 
                                      bool_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                                      OpStore %231 %238 
                               Private bool* %240 = OpAccessChain %231 %24 
                                        bool %241 = OpLoad %240 
                                                      OpSelectionMerge %245 None 
                                                      OpBranchConditional %241 %244 %248 
                                             %244 = OpLabel 
                                Private f32* %246 = OpAccessChain %223 %24 
                                         f32 %247 = OpLoad %246 
                                                      OpStore %243 %247 
                                                      OpBranch %245 
                                             %248 = OpLabel 
                                Private f32* %249 = OpAccessChain %169 %24 
                                         f32 %250 = OpLoad %249 
                                                      OpStore %243 %250 
                                                      OpBranch %245 
                                             %245 = OpLabel 
                                         f32 %251 = OpLoad %243 
                                Private f32* %252 = OpAccessChain %27 %24 
                                                      OpStore %252 %251 
                               Private bool* %253 = OpAccessChain %231 %57 
                                        bool %254 = OpLoad %253 
                                                      OpSelectionMerge %257 None 
                                                      OpBranchConditional %254 %256 %260 
                                             %256 = OpLabel 
                                Private f32* %258 = OpAccessChain %223 %57 
                                         f32 %259 = OpLoad %258 
                                                      OpStore %255 %259 
                                                      OpBranch %257 
                                             %260 = OpLabel 
                                Private f32* %261 = OpAccessChain %169 %57 
                                         f32 %262 = OpLoad %261 
                                                      OpStore %255 %262 
                                                      OpBranch %257 
                                             %257 = OpLabel 
                                         f32 %263 = OpLoad %255 
                                Private f32* %264 = OpAccessChain %27 %57 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %231 %79 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %269 None 
                                                      OpBranchConditional %266 %268 %272 
                                             %268 = OpLabel 
                                Private f32* %270 = OpAccessChain %223 %79 
                                         f32 %271 = OpLoad %270 
                                                      OpStore %267 %271 
                                                      OpBranch %269 
                                             %272 = OpLabel 
                                Private f32* %273 = OpAccessChain %169 %79 
                                         f32 %274 = OpLoad %273 
                                                      OpStore %267 %274 
                                                      OpBranch %269 
                                             %269 = OpLabel 
                                         f32 %275 = OpLoad %267 
                                Private f32* %276 = OpAccessChain %27 %79 
                                                      OpStore %276 %275 
                                       f32_3 %277 = OpLoad %27 
                              Uniform f32_4* %279 = OpAccessChain %13 %155 
                                       f32_4 %280 = OpLoad %279 
                                       f32_3 %281 = OpVectorShuffle %280 %280 2 2 2 
                                       f32_3 %282 = OpFMul %277 %281 
                                       f32_4 %283 = OpLoad %169 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %169 %284 
                              Uniform f32_4* %287 = OpAccessChain %13 %155 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 0 1 
                                       f32_2 %292 = OpFMul %289 %291 
                                                      OpStore %286 %292 
                                       f32_4 %293 = OpLoad %169 
                                       f32_2 %294 = OpVectorShuffle %293 %293 1 2 
                              Uniform f32_4* %295 = OpAccessChain %13 %155 
                                       f32_4 %296 = OpLoad %295 
                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
                                       f32_2 %298 = OpFMul %294 %297 
                                       f32_2 %299 = OpLoad %286 
                                       f32_2 %300 = OpFAdd %298 %299 
                                       f32_3 %301 = OpLoad %223 
                                       f32_3 %302 = OpVectorShuffle %301 %300 0 3 4 
                                                      OpStore %223 %302 
                                Private f32* %303 = OpAccessChain %169 %24 
                                         f32 %304 = OpLoad %303 
                                         f32 %305 = OpExtInst %1 8 %304 
                                Private f32* %306 = OpAccessChain %286 %24 
                                                      OpStore %306 %305 
                                Private f32* %307 = OpAccessChain %286 %24 
                                         f32 %308 = OpLoad %307 
                                Uniform f32* %309 = OpAccessChain %13 %155 %57 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFMul %308 %310 
                                Private f32* %312 = OpAccessChain %223 %57 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFAdd %311 %313 
                                Private f32* %315 = OpAccessChain %223 %24 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %27 %24 
                                         f32 %317 = OpLoad %316 
                                Uniform f32* %318 = OpAccessChain %13 %155 %79 
                                         f32 %319 = OpLoad %318 
                                         f32 %320 = OpFMul %317 %319 
                                Private f32* %321 = OpAccessChain %286 %24 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFNegate %322 
                                         f32 %324 = OpFAdd %320 %323 
                                Private f32* %325 = OpAccessChain %27 %24 
                                                      OpStore %325 %324 
                                       f32_3 %326 = OpLoad %154 
                                       f32_2 %327 = OpVectorShuffle %326 %326 0 1 
                                       f32_3 %328 = OpLoad %223 
                                       f32_2 %329 = OpVectorShuffle %328 %328 0 2 
                                       f32_2 %330 = OpFAdd %327 %329 
                                                      OpStore %286 %330 
                         read_only Texture2D %332 = OpLoad %331 
                                     sampler %334 = OpLoad %333 
                  read_only Texture2DSampled %335 = OpSampledImage %332 %334 
                                       f32_2 %336 = OpLoad %286 
                                       f32_4 %337 = OpImageSampleImplicitLod %335 %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                                                      OpStore %154 %338 
                         read_only Texture2D %340 = OpLoad %339 
                                     sampler %342 = OpLoad %341 
                  read_only Texture2DSampled %343 = OpSampledImage %340 %342 
                                       f32_2 %344 = OpLoad %286 
                                       f32_4 %345 = OpImageSampleImplicitLod %343 %344 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                       f32_4 %347 = OpLoad %169 
                                       f32_4 %348 = OpVectorShuffle %347 %346 4 5 6 3 
                                                      OpStore %169 %348 
                         read_only Texture2D %350 = OpLoad %331 
                                     sampler %351 = OpLoad %333 
                  read_only Texture2DSampled %352 = OpSampledImage %350 %351 
                                       f32_3 %353 = OpLoad %223 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 2 
                                       f32_4 %355 = OpImageSampleImplicitLod %352 %354 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                                                      OpStore %349 %356 
                         read_only Texture2D %357 = OpLoad %339 
                                     sampler %358 = OpLoad %341 
                  read_only Texture2DSampled %359 = OpSampledImage %357 %358 
                                       f32_3 %360 = OpLoad %223 
                                       f32_2 %361 = OpVectorShuffle %360 %360 0 2 
                                       f32_4 %362 = OpImageSampleImplicitLod %359 %361 
                                       f32_3 %363 = OpVectorShuffle %362 %362 0 1 2 
                                                      OpStore %223 %363 
                                       f32_3 %364 = OpLoad %154 
                                       f32_3 %365 = OpLoad %349 
                                       f32_3 %366 = OpFNegate %365 
                                       f32_3 %367 = OpFAdd %364 %366 
                                                      OpStore %154 %367 
                                       f32_3 %368 = OpLoad %27 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 0 0 
                                       f32_3 %370 = OpLoad %154 
                                       f32_3 %371 = OpFMul %369 %370 
                                       f32_3 %372 = OpLoad %349 
                                       f32_3 %373 = OpFAdd %371 %372 
                                                      OpStore %154 %373 
                                       f32_3 %374 = OpLoad %154 
                                       f32_3 %377 = OpFAdd %374 %376 
                                                      OpStore %349 %377 
                                       f32_3 %378 = OpLoad %349 
                                       f32_3 %381 = OpFMul %378 %380 
                                                      OpStore %349 %381 
                                       f32_3 %382 = OpLoad %349 
                                       f32_3 %383 = OpExtInst %1 4 %382 
                                       f32_3 %384 = OpExtInst %1 40 %383 %192 
                                                      OpStore %349 %384 
                                       f32_3 %385 = OpLoad %349 
                                       f32_3 %386 = OpExtInst %1 30 %385 
                                                      OpStore %349 %386 
                                       f32_3 %387 = OpLoad %349 
                                       f32_3 %390 = OpFMul %387 %389 
                                                      OpStore %349 %390 
                                       f32_3 %391 = OpLoad %349 
                                       f32_3 %392 = OpExtInst %1 29 %391 
                                                      OpStore %349 %392 
                                       f32_3 %394 = OpLoad %154 
                                       f32_3 %397 = OpFMul %394 %396 
                                                      OpStore %393 %397 
                                       f32_3 %401 = OpLoad %154 
                                       f32_4 %402 = OpVectorShuffle %401 %401 0 1 2 0 
                                      bool_4 %403 = OpFOrdGreaterThanEqual %400 %402 
                                      bool_3 %404 = OpVectorShuffle %403 %403 0 1 2 
                                                      OpStore %398 %404 
                               Private bool* %405 = OpAccessChain %398 %24 
                                        bool %406 = OpLoad %405 
                                                      OpSelectionMerge %409 None 
                                                      OpBranchConditional %406 %408 %412 
                                             %408 = OpLabel 
                                Private f32* %410 = OpAccessChain %393 %24 
                                         f32 %411 = OpLoad %410 
                                                      OpStore %407 %411 
                                                      OpBranch %409 
                                             %412 = OpLabel 
                                Private f32* %413 = OpAccessChain %349 %24 
                                         f32 %414 = OpLoad %413 
                                                      OpStore %407 %414 
                                                      OpBranch %409 
                                             %409 = OpLabel 
                                         f32 %415 = OpLoad %407 
                                Private f32* %416 = OpAccessChain %154 %24 
                                                      OpStore %416 %415 
                               Private bool* %417 = OpAccessChain %398 %57 
                                        bool %418 = OpLoad %417 
                                                      OpSelectionMerge %421 None 
                                                      OpBranchConditional %418 %420 %424 
                                             %420 = OpLabel 
                                Private f32* %422 = OpAccessChain %393 %57 
                                         f32 %423 = OpLoad %422 
                                                      OpStore %419 %423 
                                                      OpBranch %421 
                                             %424 = OpLabel 
                                Private f32* %425 = OpAccessChain %349 %57 
                                         f32 %426 = OpLoad %425 
                                                      OpStore %419 %426 
                                                      OpBranch %421 
                                             %421 = OpLabel 
                                         f32 %427 = OpLoad %419 
                                Private f32* %428 = OpAccessChain %154 %57 
                                                      OpStore %428 %427 
                               Private bool* %429 = OpAccessChain %398 %79 
                                        bool %430 = OpLoad %429 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %430 %432 %436 
                                             %432 = OpLabel 
                                Private f32* %434 = OpAccessChain %393 %79 
                                         f32 %435 = OpLoad %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                Private f32* %437 = OpAccessChain %349 %79 
                                         f32 %438 = OpLoad %437 
                                                      OpStore %431 %438 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                         f32 %439 = OpLoad %431 
                                Private f32* %440 = OpAccessChain %154 %79 
                                                      OpStore %440 %439 
                                       f32_4 %441 = OpLoad %169 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
                                       f32_3 %443 = OpLoad %223 
                                       f32_3 %444 = OpFNegate %443 
                                       f32_3 %445 = OpFAdd %442 %444 
                                       f32_4 %446 = OpLoad %169 
                                       f32_4 %447 = OpVectorShuffle %446 %445 4 5 6 3 
                                                      OpStore %169 %447 
                                       f32_3 %448 = OpLoad %27 
                                       f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
                                       f32_4 %450 = OpLoad %169 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                       f32_3 %452 = OpFMul %449 %451 
                                       f32_3 %453 = OpLoad %223 
                                       f32_3 %454 = OpFAdd %452 %453 
                                                      OpStore %27 %454 
                                       f32_3 %455 = OpLoad %27 
                                       f32_3 %456 = OpFAdd %455 %376 
                                       f32_4 %457 = OpLoad %169 
                                       f32_4 %458 = OpVectorShuffle %457 %456 4 5 6 3 
                                                      OpStore %169 %458 
                                       f32_4 %459 = OpLoad %169 
                                       f32_3 %460 = OpVectorShuffle %459 %459 0 1 2 
                                       f32_3 %461 = OpFMul %460 %380 
                                       f32_4 %462 = OpLoad %169 
                                       f32_4 %463 = OpVectorShuffle %462 %461 4 5 6 3 
                                                      OpStore %169 %463 
                                       f32_4 %464 = OpLoad %169 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                                       f32_3 %466 = OpExtInst %1 4 %465 
                                       f32_3 %467 = OpExtInst %1 40 %466 %192 
                                       f32_4 %468 = OpLoad %169 
                                       f32_4 %469 = OpVectorShuffle %468 %467 4 5 6 3 
                                                      OpStore %169 %469 
                                       f32_4 %470 = OpLoad %169 
                                       f32_3 %471 = OpVectorShuffle %470 %470 0 1 2 
                                       f32_3 %472 = OpExtInst %1 30 %471 
                                       f32_4 %473 = OpLoad %169 
                                       f32_4 %474 = OpVectorShuffle %473 %472 4 5 6 3 
                                                      OpStore %169 %474 
                                       f32_4 %475 = OpLoad %169 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpFMul %476 %389 
                                       f32_4 %478 = OpLoad %169 
                                       f32_4 %479 = OpVectorShuffle %478 %477 4 5 6 3 
                                                      OpStore %169 %479 
                                       f32_4 %480 = OpLoad %169 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                                       f32_3 %482 = OpExtInst %1 29 %481 
                                       f32_4 %483 = OpLoad %169 
                                       f32_4 %484 = OpVectorShuffle %483 %482 4 5 6 3 
                                                      OpStore %169 %484 
                                       f32_3 %485 = OpLoad %27 
                                       f32_3 %486 = OpFMul %485 %396 
                                                      OpStore %223 %486 
                                       f32_3 %488 = OpLoad %27 
                                       f32_4 %489 = OpVectorShuffle %488 %488 0 1 2 2 
                                      bool_4 %490 = OpFOrdGreaterThanEqual %487 %489 
                                      bool_3 %491 = OpVectorShuffle %490 %490 0 1 2 
                                                      OpStore %231 %491 
                               Private bool* %492 = OpAccessChain %231 %24 
                                        bool %493 = OpLoad %492 
                                                      OpSelectionMerge %496 None 
                                                      OpBranchConditional %493 %495 %499 
                                             %495 = OpLabel 
                                Private f32* %497 = OpAccessChain %223 %24 
                                         f32 %498 = OpLoad %497 
                                                      OpStore %494 %498 
                                                      OpBranch %496 
                                             %499 = OpLabel 
                                Private f32* %500 = OpAccessChain %169 %24 
                                         f32 %501 = OpLoad %500 
                                                      OpStore %494 %501 
                                                      OpBranch %496 
                                             %496 = OpLabel 
                                         f32 %502 = OpLoad %494 
                                Private f32* %503 = OpAccessChain %27 %24 
                                                      OpStore %503 %502 
                               Private bool* %504 = OpAccessChain %231 %57 
                                        bool %505 = OpLoad %504 
                                                      OpSelectionMerge %508 None 
                                                      OpBranchConditional %505 %507 %511 
                                             %507 = OpLabel 
                                Private f32* %509 = OpAccessChain %223 %57 
                                         f32 %510 = OpLoad %509 
                                                      OpStore %506 %510 
                                                      OpBranch %508 
                                             %511 = OpLabel 
                                Private f32* %512 = OpAccessChain %169 %57 
                                         f32 %513 = OpLoad %512 
                                                      OpStore %506 %513 
                                                      OpBranch %508 
                                             %508 = OpLabel 
                                         f32 %514 = OpLoad %506 
                                Private f32* %515 = OpAccessChain %27 %57 
                                                      OpStore %515 %514 
                               Private bool* %516 = OpAccessChain %231 %79 
                                        bool %517 = OpLoad %516 
                                                      OpSelectionMerge %520 None 
                                                      OpBranchConditional %517 %519 %523 
                                             %519 = OpLabel 
                                Private f32* %521 = OpAccessChain %223 %79 
                                         f32 %522 = OpLoad %521 
                                                      OpStore %518 %522 
                                                      OpBranch %520 
                                             %523 = OpLabel 
                                Private f32* %524 = OpAccessChain %169 %79 
                                         f32 %525 = OpLoad %524 
                                                      OpStore %518 %525 
                                                      OpBranch %520 
                                             %520 = OpLabel 
                                         f32 %526 = OpLoad %518 
                                Private f32* %527 = OpAccessChain %27 %79 
                                                      OpStore %527 %526 
                                       f32_3 %528 = OpLoad %27 
                                       f32_3 %529 = OpFNegate %528 
                                       f32_3 %530 = OpLoad %154 
                                       f32_3 %531 = OpFAdd %529 %530 
                                                      OpStore %154 %531 
                                       f32_3 %532 = OpLoad %9 
                                       f32_3 %533 = OpVectorShuffle %532 %532 0 0 0 
                                       f32_3 %534 = OpLoad %154 
                                       f32_3 %535 = OpFMul %533 %534 
                                       f32_3 %536 = OpLoad %27 
                                       f32_3 %537 = OpFAdd %535 %536 
                                                      OpStore %9 %537 
                                       f32_3 %538 = OpLoad %9 
                                       f32_3 %540 = OpFMul %538 %539 
                                       f32_3 %542 = OpFAdd %540 %541 
                                                      OpStore %154 %542 
                                Uniform f32* %543 = OpAccessChain %13 %176 
                                         f32 %544 = OpLoad %543 
                                       f32_3 %545 = OpCompositeConstruct %544 %544 %544 
                                       f32_3 %546 = OpLoad %154 
                                       f32_3 %547 = OpFMul %545 %546 
                                       f32_3 %548 = OpLoad %9 
                                       f32_3 %549 = OpFAdd %547 %548 
                                                      OpStore %9 %549 
                                       f32_4 %550 = OpLoad %161 
                                       f32_3 %551 = OpVectorShuffle %550 %550 0 1 2 
                                       f32_3 %552 = OpFNegate %551 
                                       f32_3 %553 = OpLoad %9 
                                       f32_3 %554 = OpFAdd %552 %553 
                                                      OpStore %9 %554 
                              Uniform f32_4* %557 = OpAccessChain %13 %155 
                                       f32_4 %558 = OpLoad %557 
                                       f32_3 %559 = OpVectorShuffle %558 %558 3 3 3 
                                       f32_3 %560 = OpLoad %9 
                                       f32_3 %561 = OpFMul %559 %560 
                                       f32_4 %562 = OpLoad %161 
                                       f32_3 %563 = OpVectorShuffle %562 %562 0 1 2 
                                       f32_3 %564 = OpFAdd %561 %563 
                                       f32_4 %565 = OpLoad %556 
                                       f32_4 %566 = OpVectorShuffle %565 %564 4 5 6 3 
                                                      OpStore %556 %566 
                                Private f32* %567 = OpAccessChain %161 %17 
                                         f32 %568 = OpLoad %567 
                                 Output f32* %570 = OpAccessChain %556 %17 
                                                      OpStore %570 %568 
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