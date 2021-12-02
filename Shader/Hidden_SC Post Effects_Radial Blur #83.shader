//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Radial Blur" {
Properties {
}
SubShader {
 Pass {
  Name "Radial Blur"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3812
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
uniform 	float _Amount;
uniform 	float _Iterations;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
int u_xlati2;
vec4 u_xlat3;
float u_xlat6;
bool u_xlatb6;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlatb8 = 0.0<_Iterations;
    if(u_xlatb8){
        u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + vs_TEXCOORD1.xy;
        u_xlati2 = 1;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
        u_xlat1.w = float(0.0);
        u_xlat8.xy = vs_TEXCOORD1.xy;
        u_xlati2 = 0;
    }
    u_xlat6 = float(u_xlati2);
    u_xlatb6 = u_xlat6<_Iterations;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 2;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 3;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 4;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 5;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 6;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 7;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 8;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 9;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 10;
    }
    u_xlat10 = float(u_xlati2);
    u_xlatb10 = u_xlat10<_Iterations;
    u_xlatb6 = u_xlatb10 && u_xlatb6;
    if(u_xlatb6){
        u_xlat3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat1 + u_xlat3;
        u_xlat8.xy = u_xlat0.xy * vec2(_Amount) + u_xlat8.xy;
        u_xlati2 = 11;
    }
    u_xlat0.x = float(u_xlati2);
    u_xlatb0 = u_xlat0.x<_Iterations;
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    if(u_xlatb0){
        u_xlat0 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat0 + u_xlat1;
    }
    SV_Target0 = u_xlat1 / vec4(vec4(_Iterations, _Iterations, _Iterations, _Iterations));
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
; Bound: 409
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %12 %47 %391 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %24 0 Offset 24 
                                             OpMemberDecorate %24 1 Offset 24 
                                             OpDecorate %24 Block 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %39 DescriptorSet 39 
                                             OpDecorate %39 Binding 39 
                                             OpDecorate %43 DescriptorSet 43 
                                             OpDecorate %43 Binding 43 
                                             OpDecorate vs_TEXCOORD1 Location 47 
                                             OpDecorate %391 Location 391 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %15 = OpConstant 3.674022E-40 
                               f32_2 %16 = OpConstantComposite %15 %15 
                                     %20 = OpTypeBool 
                                     %21 = OpTypePointer Private %20 
                       Private bool* %22 = OpVariable Private 
                                 f32 %23 = OpConstant 3.674022E-40 
                                     %24 = OpTypeStruct %6 %6 
                                     %25 = OpTypePointer Uniform %24 
         Uniform struct {f32; f32;}* %26 = OpVariable Uniform 
                                     %27 = OpTypeInt 32 1 
                                 i32 %28 = OpConstant 1 
                                     %29 = OpTypePointer Uniform %6 
                      Private f32_4* %36 = OpVariable Private 
                                     %37 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %38 = OpTypePointer UniformConstant %37 
UniformConstant read_only Texture2D* %39 = OpVariable UniformConstant 
                                     %41 = OpTypeSampler 
                                     %42 = OpTypePointer UniformConstant %41 
            UniformConstant sampler* %43 = OpVariable UniformConstant 
                                     %45 = OpTypeSampledImage %37 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %50 = OpTypePointer Private %10 
                      Private f32_2* %51 = OpVariable Private 
                                 i32 %54 = OpConstant 0 
                                     %61 = OpTypePointer Private %27 
                        Private i32* %62 = OpVariable Private 
                                     %64 = OpTypeInt 32 0 
                                 u32 %65 = OpConstant 0 
                                     %66 = OpTypePointer Private %6 
                                 u32 %68 = OpConstant 1 
                                 u32 %70 = OpConstant 2 
                                 u32 %72 = OpConstant 3 
                        Private f32* %75 = OpVariable Private 
                       Private bool* %78 = OpVariable Private 
                      Private f32_4* %86 = OpVariable Private 
                                i32 %103 = OpConstant 2 
                       Private f32* %104 = OpVariable Private 
                      Private bool* %107 = OpVariable Private 
                                i32 %134 = OpConstant 3 
                                i32 %163 = OpConstant 4 
                                i32 %192 = OpConstant 5 
                                i32 %221 = OpConstant 6 
                                i32 %250 = OpConstant 7 
                                i32 %279 = OpConstant 8 
                                i32 %308 = OpConstant 9 
                                i32 %337 = OpConstant 10 
                                i32 %366 = OpConstant 11 
                      Private bool* %370 = OpVariable Private 
                                    %390 = OpTypePointer Output %7 
                      Output f32_4* %391 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpFNegate %13 
                               f32_2 %17 = OpFAdd %14 %16 
                               f32_4 %18 = OpLoad %9 
                               f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                             OpStore %9 %19 
                        Uniform f32* %30 = OpAccessChain %26 %28 
                                 f32 %31 = OpLoad %30 
                                bool %32 = OpFOrdLessThan %23 %31 
                                             OpStore %22 %32 
                                bool %33 = OpLoad %22 
                                             OpSelectionMerge %35 None 
                                             OpBranchConditional %33 %34 %63 
                                     %34 = OpLabel 
                 read_only Texture2D %40 = OpLoad %39 
                             sampler %44 = OpLoad %43 
          read_only Texture2DSampled %46 = OpSampledImage %40 %44 
                               f32_2 %48 = OpLoad vs_TEXCOORD1 
                               f32_4 %49 = OpImageSampleImplicitLod %46 %48 
                                             OpStore %36 %49 
                               f32_4 %52 = OpLoad %9 
                               f32_2 %53 = OpVectorShuffle %52 %52 0 1 
                        Uniform f32* %55 = OpAccessChain %26 %54 
                                 f32 %56 = OpLoad %55 
                               f32_2 %57 = OpCompositeConstruct %56 %56 
                               f32_2 %58 = OpFMul %53 %57 
                               f32_2 %59 = OpLoad vs_TEXCOORD1 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore %51 %60 
                                             OpStore %62 %28 
                                             OpBranch %35 
                                     %63 = OpLabel 
                        Private f32* %67 = OpAccessChain %36 %65 
                                             OpStore %67 %23 
                        Private f32* %69 = OpAccessChain %36 %68 
                                             OpStore %69 %23 
                        Private f32* %71 = OpAccessChain %36 %70 
                                             OpStore %71 %23 
                        Private f32* %73 = OpAccessChain %36 %72 
                                             OpStore %73 %23 
                               f32_2 %74 = OpLoad vs_TEXCOORD1 
                                             OpStore %51 %74 
                                             OpStore %62 %54 
                                             OpBranch %35 
                                     %35 = OpLabel 
                                 i32 %76 = OpLoad %62 
                                 f32 %77 = OpConvertSToF %76 
                                             OpStore %75 %77 
                                 f32 %79 = OpLoad %75 
                        Uniform f32* %80 = OpAccessChain %26 %28 
                                 f32 %81 = OpLoad %80 
                                bool %82 = OpFOrdLessThan %79 %81 
                                             OpStore %78 %82 
                                bool %83 = OpLoad %78 
                                             OpSelectionMerge %85 None 
                                             OpBranchConditional %83 %84 %85 
                                     %84 = OpLabel 
                 read_only Texture2D %87 = OpLoad %39 
                             sampler %88 = OpLoad %43 
          read_only Texture2DSampled %89 = OpSampledImage %87 %88 
                               f32_2 %90 = OpLoad %51 
                               f32_4 %91 = OpImageSampleImplicitLod %89 %90 
                                             OpStore %86 %91 
                               f32_4 %92 = OpLoad %36 
                               f32_4 %93 = OpLoad %86 
                               f32_4 %94 = OpFAdd %92 %93 
                                             OpStore %36 %94 
                               f32_4 %95 = OpLoad %9 
                               f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                        Uniform f32* %97 = OpAccessChain %26 %54 
                                 f32 %98 = OpLoad %97 
                               f32_2 %99 = OpCompositeConstruct %98 %98 
                              f32_2 %100 = OpFMul %96 %99 
                              f32_2 %101 = OpLoad %51 
                              f32_2 %102 = OpFAdd %100 %101 
                                             OpStore %51 %102 
                                             OpStore %62 %103 
                                             OpBranch %85 
                                     %85 = OpLabel 
                                i32 %105 = OpLoad %62 
                                f32 %106 = OpConvertSToF %105 
                                             OpStore %104 %106 
                                f32 %108 = OpLoad %104 
                       Uniform f32* %109 = OpAccessChain %26 %28 
                                f32 %110 = OpLoad %109 
                               bool %111 = OpFOrdLessThan %108 %110 
                                             OpStore %107 %111 
                               bool %112 = OpLoad %107 
                               bool %113 = OpLoad %78 
                               bool %114 = OpLogicalAnd %112 %113 
                                             OpStore %78 %114 
                               bool %115 = OpLoad %78 
                                             OpSelectionMerge %117 None 
                                             OpBranchConditional %115 %116 %117 
                                    %116 = OpLabel 
                read_only Texture2D %118 = OpLoad %39 
                            sampler %119 = OpLoad %43 
         read_only Texture2DSampled %120 = OpSampledImage %118 %119 
                              f32_2 %121 = OpLoad %51 
                              f32_4 %122 = OpImageSampleImplicitLod %120 %121 
                                             OpStore %86 %122 
                              f32_4 %123 = OpLoad %36 
                              f32_4 %124 = OpLoad %86 
                              f32_4 %125 = OpFAdd %123 %124 
                                             OpStore %36 %125 
                              f32_4 %126 = OpLoad %9 
                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                       Uniform f32* %128 = OpAccessChain %26 %54 
                                f32 %129 = OpLoad %128 
                              f32_2 %130 = OpCompositeConstruct %129 %129 
                              f32_2 %131 = OpFMul %127 %130 
                              f32_2 %132 = OpLoad %51 
                              f32_2 %133 = OpFAdd %131 %132 
                                             OpStore %51 %133 
                                             OpStore %62 %134 
                                             OpBranch %117 
                                    %117 = OpLabel 
                                i32 %135 = OpLoad %62 
                                f32 %136 = OpConvertSToF %135 
                                             OpStore %104 %136 
                                f32 %137 = OpLoad %104 
                       Uniform f32* %138 = OpAccessChain %26 %28 
                                f32 %139 = OpLoad %138 
                               bool %140 = OpFOrdLessThan %137 %139 
                                             OpStore %107 %140 
                               bool %141 = OpLoad %107 
                               bool %142 = OpLoad %78 
                               bool %143 = OpLogicalAnd %141 %142 
                                             OpStore %78 %143 
                               bool %144 = OpLoad %78 
                                             OpSelectionMerge %146 None 
                                             OpBranchConditional %144 %145 %146 
                                    %145 = OpLabel 
                read_only Texture2D %147 = OpLoad %39 
                            sampler %148 = OpLoad %43 
         read_only Texture2DSampled %149 = OpSampledImage %147 %148 
                              f32_2 %150 = OpLoad %51 
                              f32_4 %151 = OpImageSampleImplicitLod %149 %150 
                                             OpStore %86 %151 
                              f32_4 %152 = OpLoad %36 
                              f32_4 %153 = OpLoad %86 
                              f32_4 %154 = OpFAdd %152 %153 
                                             OpStore %36 %154 
                              f32_4 %155 = OpLoad %9 
                              f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                       Uniform f32* %157 = OpAccessChain %26 %54 
                                f32 %158 = OpLoad %157 
                              f32_2 %159 = OpCompositeConstruct %158 %158 
                              f32_2 %160 = OpFMul %156 %159 
                              f32_2 %161 = OpLoad %51 
                              f32_2 %162 = OpFAdd %160 %161 
                                             OpStore %51 %162 
                                             OpStore %62 %163 
                                             OpBranch %146 
                                    %146 = OpLabel 
                                i32 %164 = OpLoad %62 
                                f32 %165 = OpConvertSToF %164 
                                             OpStore %104 %165 
                                f32 %166 = OpLoad %104 
                       Uniform f32* %167 = OpAccessChain %26 %28 
                                f32 %168 = OpLoad %167 
                               bool %169 = OpFOrdLessThan %166 %168 
                                             OpStore %107 %169 
                               bool %170 = OpLoad %107 
                               bool %171 = OpLoad %78 
                               bool %172 = OpLogicalAnd %170 %171 
                                             OpStore %78 %172 
                               bool %173 = OpLoad %78 
                                             OpSelectionMerge %175 None 
                                             OpBranchConditional %173 %174 %175 
                                    %174 = OpLabel 
                read_only Texture2D %176 = OpLoad %39 
                            sampler %177 = OpLoad %43 
         read_only Texture2DSampled %178 = OpSampledImage %176 %177 
                              f32_2 %179 = OpLoad %51 
                              f32_4 %180 = OpImageSampleImplicitLod %178 %179 
                                             OpStore %86 %180 
                              f32_4 %181 = OpLoad %36 
                              f32_4 %182 = OpLoad %86 
                              f32_4 %183 = OpFAdd %181 %182 
                                             OpStore %36 %183 
                              f32_4 %184 = OpLoad %9 
                              f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                       Uniform f32* %186 = OpAccessChain %26 %54 
                                f32 %187 = OpLoad %186 
                              f32_2 %188 = OpCompositeConstruct %187 %187 
                              f32_2 %189 = OpFMul %185 %188 
                              f32_2 %190 = OpLoad %51 
                              f32_2 %191 = OpFAdd %189 %190 
                                             OpStore %51 %191 
                                             OpStore %62 %192 
                                             OpBranch %175 
                                    %175 = OpLabel 
                                i32 %193 = OpLoad %62 
                                f32 %194 = OpConvertSToF %193 
                                             OpStore %104 %194 
                                f32 %195 = OpLoad %104 
                       Uniform f32* %196 = OpAccessChain %26 %28 
                                f32 %197 = OpLoad %196 
                               bool %198 = OpFOrdLessThan %195 %197 
                                             OpStore %107 %198 
                               bool %199 = OpLoad %107 
                               bool %200 = OpLoad %78 
                               bool %201 = OpLogicalAnd %199 %200 
                                             OpStore %78 %201 
                               bool %202 = OpLoad %78 
                                             OpSelectionMerge %204 None 
                                             OpBranchConditional %202 %203 %204 
                                    %203 = OpLabel 
                read_only Texture2D %205 = OpLoad %39 
                            sampler %206 = OpLoad %43 
         read_only Texture2DSampled %207 = OpSampledImage %205 %206 
                              f32_2 %208 = OpLoad %51 
                              f32_4 %209 = OpImageSampleImplicitLod %207 %208 
                                             OpStore %86 %209 
                              f32_4 %210 = OpLoad %36 
                              f32_4 %211 = OpLoad %86 
                              f32_4 %212 = OpFAdd %210 %211 
                                             OpStore %36 %212 
                              f32_4 %213 = OpLoad %9 
                              f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                       Uniform f32* %215 = OpAccessChain %26 %54 
                                f32 %216 = OpLoad %215 
                              f32_2 %217 = OpCompositeConstruct %216 %216 
                              f32_2 %218 = OpFMul %214 %217 
                              f32_2 %219 = OpLoad %51 
                              f32_2 %220 = OpFAdd %218 %219 
                                             OpStore %51 %220 
                                             OpStore %62 %221 
                                             OpBranch %204 
                                    %204 = OpLabel 
                                i32 %222 = OpLoad %62 
                                f32 %223 = OpConvertSToF %222 
                                             OpStore %104 %223 
                                f32 %224 = OpLoad %104 
                       Uniform f32* %225 = OpAccessChain %26 %28 
                                f32 %226 = OpLoad %225 
                               bool %227 = OpFOrdLessThan %224 %226 
                                             OpStore %107 %227 
                               bool %228 = OpLoad %107 
                               bool %229 = OpLoad %78 
                               bool %230 = OpLogicalAnd %228 %229 
                                             OpStore %78 %230 
                               bool %231 = OpLoad %78 
                                             OpSelectionMerge %233 None 
                                             OpBranchConditional %231 %232 %233 
                                    %232 = OpLabel 
                read_only Texture2D %234 = OpLoad %39 
                            sampler %235 = OpLoad %43 
         read_only Texture2DSampled %236 = OpSampledImage %234 %235 
                              f32_2 %237 = OpLoad %51 
                              f32_4 %238 = OpImageSampleImplicitLod %236 %237 
                                             OpStore %86 %238 
                              f32_4 %239 = OpLoad %36 
                              f32_4 %240 = OpLoad %86 
                              f32_4 %241 = OpFAdd %239 %240 
                                             OpStore %36 %241 
                              f32_4 %242 = OpLoad %9 
                              f32_2 %243 = OpVectorShuffle %242 %242 0 1 
                       Uniform f32* %244 = OpAccessChain %26 %54 
                                f32 %245 = OpLoad %244 
                              f32_2 %246 = OpCompositeConstruct %245 %245 
                              f32_2 %247 = OpFMul %243 %246 
                              f32_2 %248 = OpLoad %51 
                              f32_2 %249 = OpFAdd %247 %248 
                                             OpStore %51 %249 
                                             OpStore %62 %250 
                                             OpBranch %233 
                                    %233 = OpLabel 
                                i32 %251 = OpLoad %62 
                                f32 %252 = OpConvertSToF %251 
                                             OpStore %104 %252 
                                f32 %253 = OpLoad %104 
                       Uniform f32* %254 = OpAccessChain %26 %28 
                                f32 %255 = OpLoad %254 
                               bool %256 = OpFOrdLessThan %253 %255 
                                             OpStore %107 %256 
                               bool %257 = OpLoad %107 
                               bool %258 = OpLoad %78 
                               bool %259 = OpLogicalAnd %257 %258 
                                             OpStore %78 %259 
                               bool %260 = OpLoad %78 
                                             OpSelectionMerge %262 None 
                                             OpBranchConditional %260 %261 %262 
                                    %261 = OpLabel 
                read_only Texture2D %263 = OpLoad %39 
                            sampler %264 = OpLoad %43 
         read_only Texture2DSampled %265 = OpSampledImage %263 %264 
                              f32_2 %266 = OpLoad %51 
                              f32_4 %267 = OpImageSampleImplicitLod %265 %266 
                                             OpStore %86 %267 
                              f32_4 %268 = OpLoad %36 
                              f32_4 %269 = OpLoad %86 
                              f32_4 %270 = OpFAdd %268 %269 
                                             OpStore %36 %270 
                              f32_4 %271 = OpLoad %9 
                              f32_2 %272 = OpVectorShuffle %271 %271 0 1 
                       Uniform f32* %273 = OpAccessChain %26 %54 
                                f32 %274 = OpLoad %273 
                              f32_2 %275 = OpCompositeConstruct %274 %274 
                              f32_2 %276 = OpFMul %272 %275 
                              f32_2 %277 = OpLoad %51 
                              f32_2 %278 = OpFAdd %276 %277 
                                             OpStore %51 %278 
                                             OpStore %62 %279 
                                             OpBranch %262 
                                    %262 = OpLabel 
                                i32 %280 = OpLoad %62 
                                f32 %281 = OpConvertSToF %280 
                                             OpStore %104 %281 
                                f32 %282 = OpLoad %104 
                       Uniform f32* %283 = OpAccessChain %26 %28 
                                f32 %284 = OpLoad %283 
                               bool %285 = OpFOrdLessThan %282 %284 
                                             OpStore %107 %285 
                               bool %286 = OpLoad %107 
                               bool %287 = OpLoad %78 
                               bool %288 = OpLogicalAnd %286 %287 
                                             OpStore %78 %288 
                               bool %289 = OpLoad %78 
                                             OpSelectionMerge %291 None 
                                             OpBranchConditional %289 %290 %291 
                                    %290 = OpLabel 
                read_only Texture2D %292 = OpLoad %39 
                            sampler %293 = OpLoad %43 
         read_only Texture2DSampled %294 = OpSampledImage %292 %293 
                              f32_2 %295 = OpLoad %51 
                              f32_4 %296 = OpImageSampleImplicitLod %294 %295 
                                             OpStore %86 %296 
                              f32_4 %297 = OpLoad %36 
                              f32_4 %298 = OpLoad %86 
                              f32_4 %299 = OpFAdd %297 %298 
                                             OpStore %36 %299 
                              f32_4 %300 = OpLoad %9 
                              f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                       Uniform f32* %302 = OpAccessChain %26 %54 
                                f32 %303 = OpLoad %302 
                              f32_2 %304 = OpCompositeConstruct %303 %303 
                              f32_2 %305 = OpFMul %301 %304 
                              f32_2 %306 = OpLoad %51 
                              f32_2 %307 = OpFAdd %305 %306 
                                             OpStore %51 %307 
                                             OpStore %62 %308 
                                             OpBranch %291 
                                    %291 = OpLabel 
                                i32 %309 = OpLoad %62 
                                f32 %310 = OpConvertSToF %309 
                                             OpStore %104 %310 
                                f32 %311 = OpLoad %104 
                       Uniform f32* %312 = OpAccessChain %26 %28 
                                f32 %313 = OpLoad %312 
                               bool %314 = OpFOrdLessThan %311 %313 
                                             OpStore %107 %314 
                               bool %315 = OpLoad %107 
                               bool %316 = OpLoad %78 
                               bool %317 = OpLogicalAnd %315 %316 
                                             OpStore %78 %317 
                               bool %318 = OpLoad %78 
                                             OpSelectionMerge %320 None 
                                             OpBranchConditional %318 %319 %320 
                                    %319 = OpLabel 
                read_only Texture2D %321 = OpLoad %39 
                            sampler %322 = OpLoad %43 
         read_only Texture2DSampled %323 = OpSampledImage %321 %322 
                              f32_2 %324 = OpLoad %51 
                              f32_4 %325 = OpImageSampleImplicitLod %323 %324 
                                             OpStore %86 %325 
                              f32_4 %326 = OpLoad %36 
                              f32_4 %327 = OpLoad %86 
                              f32_4 %328 = OpFAdd %326 %327 
                                             OpStore %36 %328 
                              f32_4 %329 = OpLoad %9 
                              f32_2 %330 = OpVectorShuffle %329 %329 0 1 
                       Uniform f32* %331 = OpAccessChain %26 %54 
                                f32 %332 = OpLoad %331 
                              f32_2 %333 = OpCompositeConstruct %332 %332 
                              f32_2 %334 = OpFMul %330 %333 
                              f32_2 %335 = OpLoad %51 
                              f32_2 %336 = OpFAdd %334 %335 
                                             OpStore %51 %336 
                                             OpStore %62 %337 
                                             OpBranch %320 
                                    %320 = OpLabel 
                                i32 %338 = OpLoad %62 
                                f32 %339 = OpConvertSToF %338 
                                             OpStore %104 %339 
                                f32 %340 = OpLoad %104 
                       Uniform f32* %341 = OpAccessChain %26 %28 
                                f32 %342 = OpLoad %341 
                               bool %343 = OpFOrdLessThan %340 %342 
                                             OpStore %107 %343 
                               bool %344 = OpLoad %107 
                               bool %345 = OpLoad %78 
                               bool %346 = OpLogicalAnd %344 %345 
                                             OpStore %78 %346 
                               bool %347 = OpLoad %78 
                                             OpSelectionMerge %349 None 
                                             OpBranchConditional %347 %348 %349 
                                    %348 = OpLabel 
                read_only Texture2D %350 = OpLoad %39 
                            sampler %351 = OpLoad %43 
         read_only Texture2DSampled %352 = OpSampledImage %350 %351 
                              f32_2 %353 = OpLoad %51 
                              f32_4 %354 = OpImageSampleImplicitLod %352 %353 
                                             OpStore %86 %354 
                              f32_4 %355 = OpLoad %36 
                              f32_4 %356 = OpLoad %86 
                              f32_4 %357 = OpFAdd %355 %356 
                                             OpStore %36 %357 
                              f32_4 %358 = OpLoad %9 
                              f32_2 %359 = OpVectorShuffle %358 %358 0 1 
                       Uniform f32* %360 = OpAccessChain %26 %54 
                                f32 %361 = OpLoad %360 
                              f32_2 %362 = OpCompositeConstruct %361 %361 
                              f32_2 %363 = OpFMul %359 %362 
                              f32_2 %364 = OpLoad %51 
                              f32_2 %365 = OpFAdd %363 %364 
                                             OpStore %51 %365 
                                             OpStore %62 %366 
                                             OpBranch %349 
                                    %349 = OpLabel 
                                i32 %367 = OpLoad %62 
                                f32 %368 = OpConvertSToF %367 
                       Private f32* %369 = OpAccessChain %9 %65 
                                             OpStore %369 %368 
                       Private f32* %371 = OpAccessChain %9 %65 
                                f32 %372 = OpLoad %371 
                       Uniform f32* %373 = OpAccessChain %26 %28 
                                f32 %374 = OpLoad %373 
                               bool %375 = OpFOrdLessThan %372 %374 
                                             OpStore %370 %375 
                               bool %376 = OpLoad %370 
                               bool %377 = OpLoad %78 
                               bool %378 = OpLogicalAnd %376 %377 
                                             OpStore %370 %378 
                               bool %379 = OpLoad %370 
                                             OpSelectionMerge %381 None 
                                             OpBranchConditional %379 %380 %381 
                                    %380 = OpLabel 
                read_only Texture2D %382 = OpLoad %39 
                            sampler %383 = OpLoad %43 
         read_only Texture2DSampled %384 = OpSampledImage %382 %383 
                              f32_2 %385 = OpLoad %51 
                              f32_4 %386 = OpImageSampleImplicitLod %384 %385 
                                             OpStore %9 %386 
                              f32_4 %387 = OpLoad %9 
                              f32_4 %388 = OpLoad %36 
                              f32_4 %389 = OpFAdd %387 %388 
                                             OpStore %36 %389 
                                             OpBranch %381 
                                    %381 = OpLabel 
                              f32_4 %392 = OpLoad %36 
                       Uniform f32* %393 = OpAccessChain %26 %28 
                                f32 %394 = OpLoad %393 
                       Uniform f32* %395 = OpAccessChain %26 %28 
                                f32 %396 = OpLoad %395 
                       Uniform f32* %397 = OpAccessChain %26 %28 
                                f32 %398 = OpLoad %397 
                       Uniform f32* %399 = OpAccessChain %26 %28 
                                f32 %400 = OpLoad %399 
                              f32_4 %401 = OpCompositeConstruct %394 %396 %398 %400 
                                f32 %402 = OpCompositeExtract %401 0 
                                f32 %403 = OpCompositeExtract %401 1 
                                f32 %404 = OpCompositeExtract %401 2 
                                f32 %405 = OpCompositeExtract %401 3 
                              f32_4 %406 = OpCompositeConstruct %402 %403 %404 %405 
                              f32_4 %407 = OpFDiv %392 %406 
                                             OpStore %391 %407 
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